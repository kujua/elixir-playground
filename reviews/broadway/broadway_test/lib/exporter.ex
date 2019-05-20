defmodule Exporter do
  @moduledoc false

  use GenStage

  def init(:ok) do
    {:consumer, 0}
  end

  def handle_events(events, _from, state) do
    # process
    IO.inspect(events, label: "Exporter: event")
    {:noreply, [], state}
  end
end
