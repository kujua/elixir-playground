defmodule Imageresizer do
  @moduledoc false

  use GenStage
  alias ImageProcessingModel

  def process(data) do
    IO.inspect(data, label: "Imageresizer - process data")
    success = GenStage.call(__MODULE__, {:process, data}, 3000)
    IO.inspect(success, label: "return genstage call - success")
    case success do
      :ok -> data
      _ -> data = set_status(data, :error)
    end
  end

  def start_link(state) do
    GenStage.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    {:producer, state}
  end

  def handle_call({:process, event}, _from, state) do

    IO.inspect(event, label: "Imageresizer - call - event data")

    resizename = event.customer_id
                  <> "_"
                  <> String.replace_trailing(event.file_name, "."
                  <> event.image_type, "")
                  <> "-resized."
                  <> event.image_type

    IO.inspect(resizename, label: "Imageresizer - call - resizename")

    task = Task.async(fn -> runmagick(event.file_name, resizename)  end)
    {_,ret} = Task.await(task)

    IO.inspect(ret, label: "Imageresizer - returned from task")

    case ret do
      0 -> {:reply, :ok, [event], state}
      _ -> {:reply, :error, [%{event | status: :error}], state}
    end
  end

  def handle_demand(_demand, state) do
    {:noreply, [], state}
  end

  defp runmagick(from, to) do
     System.cmd("./assets/resize.sh", ["assets/" <> from, "assets/" <> to])
  end

  defp set_status(model, status) do
    %{model | status: status}
  end
end