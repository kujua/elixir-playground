defmodule Imagewatermark do
  @moduledoc false

  use GenStage

  def init(_opts) do
    {:producer_consuner, %{}}
  end

  def handle_events(events, _from, state) do
    # save file
    {:noreply, events, state}
  end
end
