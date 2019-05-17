defmodule Exporter do
  @moduledoc false

  use GenStage

  def init(:ok) do
    {:consumer, %{}}
  end

  def handle_events(events, _from, state) do
    # process
    {:noreply, %{}, state}
  end
end
