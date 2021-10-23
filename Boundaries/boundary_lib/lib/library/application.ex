defmodule Library.Application do
  @moduledoc false
  use Boundary, deps: [], exports: [], top_level?: true
  use Application

  def start(_type, _args) do
    children = [
      # {Library.Worker, arg}
    ]

    opts = [strategy: :one_for_one, name: Library.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
