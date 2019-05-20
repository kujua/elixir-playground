defmodule BroadwayTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  use Supervisor
  
  def start(_type, _args) do
    # List all child processes to be supervised
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
