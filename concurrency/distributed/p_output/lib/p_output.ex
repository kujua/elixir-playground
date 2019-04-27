defmodule POutput do
  @moduledoc false

  def receive_message(msg) do
#    IO.puts(msg)
    POutputWorker.send(msg)
  end

end
