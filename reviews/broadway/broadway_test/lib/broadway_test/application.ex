defmodule BroadwayTest.Application do
  @moduledoc false

  use Application
  use Supervisor
  
  def start(_type, _args) do
    children = [
      BroadwayTest,
      Imageresizer,
      Imagewatermark,
      Exporter
    ]

    opts = [strategy: :one_for_one, name: BroadwayTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
