defmodule Imagewatermark do
  @moduledoc false

  use GenStage

  def init(state) do
    {:producer_consumer, state}
  end

  def handle_events(events, _from, state) do
    # process
    IO.inspect(events, label: "Imagewatermark: event")
    {:noreply, events, state}
  end
end
