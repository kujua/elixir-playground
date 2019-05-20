defmodule Imagewatermark do
  @moduledoc false

  use GenStage

  def start_link(state) do
    GenStage.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [Imageresizer]}
  end

  def handle_events(events, _from, state) do

#    str_watermark = ["-background", "#0008 -fill white -gravity center, -pointsize 40, caption:'Broadway Example' +swap -gravity south ", "assets/warthog.jpg", "-composite",  "assets/warthog-watermark.png"]
    str_watermark = ["label:BROADWAY EXAMPLE", "assets/warthog-resized.jpg", "assets/warthog-watermark.jpg"]
    task = Task.async(fn -> System.cmd("composite", str_watermark) end)
    ret = Task.await(task)
    IO.inspect(events, label: "Imagewatermark - event")
    IO.inspect(ret, label: "Imagewatermark - returned from task")
    {:noreply, events, state}
  end
end
