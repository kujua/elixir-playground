defmodule PEcho do
  @moduledoc false

  def echo_message(msg) do
    #POutput.receive_message(msg)
    PEchoWorker.send_to_output(msg)
  end
end
