defmodule PEcho do
  @moduledoc false

  def echo_message(msg) do
    #POutput.receive_message(msg)
#    PEchoWorker.send_to_output(msg)
    nodename = "n3@127.0.0.1"
    message = Task.Supervisor.async({POutput.TaskSupervisor, String.to_atom(nodename)}, POutput, :receive_message, [msg])
              |> Task.await()
  end
end
