defmodule BoundariesExample.Cli.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # {BoundariesExample.Cli.Worker, arg}
    ]

    opts = [strategy: :one_for_one, name: BoundariesExample.Cli.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
