defmodule PSource do
  @moduledoc false

  def send_to_echo do
#    PSourceWorker.echo "1: Hello"
#    PSourceWorker.echo "1: World"
#    PSourceWorker.echo "2: Hello"
#    PSourceWorker.echo "2: World"

#    nodename = Application.get_env(:contentissimum_api, Contentissimum.Api.Web.Endpoint)[:logic_node]
    nodename = "n2@127.0.0.1"
    Task.Supervisor.async({PEcho.TaskSupervisor, String.to_atom(nodename)}, PEcho, :echo_message, ["1: Hello"])
              |> Task.await()
    Task.Supervisor.async({PEcho.TaskSupervisor, String.to_atom(nodename)}, PEcho, :echo_message, ["1: World"])
              |> Task.await()
    Task.Supervisor.async({PEcho.TaskSupervisor, String.to_atom(nodename)}, PEcho, :echo_message, ["2: Hello"])
              |> Task.await()
    Task.Supervisor.async({PEcho.TaskSupervisor, String.to_atom(nodename)}, PEcho, :echo_message, ["2: World"])
              |> Task.await()

  end
end
