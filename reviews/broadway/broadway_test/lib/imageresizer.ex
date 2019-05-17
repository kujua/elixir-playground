defmodule Imageresizer do
  @moduledoc false

  use GenStage

  def init(_demand) do
    {:producer, %{}}
  end

  def handle_demand(_demand, state) do
    # create events
    {:noreply, %{}, state}
  end

end