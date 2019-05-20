defmodule Exporter do
  @moduledoc false

  use GenStage

  def start_link(state) do
    GenStage.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(_state) do
    {:consumer, 0, subscribe_to: [Imagewatermark]}
  end

  def handle_events(events, _from, state) do
    # process
    IO.inspect(events, label: "Exporter - event")
    {:noreply, [], state}
  end
end
