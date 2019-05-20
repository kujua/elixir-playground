defmodule Imageresizer do
  @moduledoc false

  use GenStage

  def process(data) do
    IO.inspect(data, label: "Imageresizer - process data")
    GenStage.call(__MODULE__, {:process, data}, 500)
  end

  def start_link(state) do
    GenStage.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    {:producer, state}
  end

  def handle_call({:process, event}, _from, state) do
    IO.inspect(event.id, label: "Imageresizer - call - id")
    IO.inspect(event.name, label: "Imageresizer - call - name")
    resizename = String.replace_trailing(event.name, ".jpg", "") <> "-resized.jpg"
    task = Task.async(fn -> runmagick(event.name, resizename)  end)
    {_,ret} = Task.await(task)
    IO.inspect(ret, label: "Imageresizer - returned from task")
    # error handling
    {:reply, :ok, [event], state}
  end

  def handle_demand(_demand, state) do
    {:noreply, [], state}
  end

  defp runmagick(from, to) do
     System.cmd("./assets/resize.sh", ["assets/" <> from, "assets/" <> to])
  end
end