defmodule PEcho do
  @moduledoc false

  def echo_message(msg) do
    POutput.receive_message(msg)
  end
end
