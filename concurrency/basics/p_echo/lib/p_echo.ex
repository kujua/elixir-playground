defmodule PEcho do
  @moduledoc """
  Documentation for PEcho.
  """
  
  def echo_message(msg) do
    POutput.receive_message(msg)
  end
end
