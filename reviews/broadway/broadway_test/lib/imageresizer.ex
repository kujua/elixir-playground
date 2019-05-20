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
    str_resize = ["convert", event.name, "-resize 50%", "assets/" <> event.name <> ".jpg"]
    task = Task.async(fn -> System.cmd("./assets/resize.sh", []) end)
    ret = Task.await(task)

    IO.inspect(ret, label: "Imageresizer - returned from task")
    {:reply, :ok, [event], state} # Dispatch immediately
  end

  def handle_demand(_demand, state) do
    {:noreply, [], state}
  end

end