defmodule Imageresizer do
  @moduledoc false

  use GenStage

  def init(state) do
    {:producer, state}
  end

  def handle_demand(demand, state) do
    # create events
    events = state
#    {to_dispatch, remaining} = Enum.split(events, demand)
    IO.inspect(events, label: "Imageresizer: demand")
    {:noreply, [events], state}
  end

end