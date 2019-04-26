defmodule POutput do
  @moduledoc """
  Documentation for POutput.
  """

  

  @doc """
  Hello world.
  """
  def receive_message(msg) do
    IO.puts(msg)
    {:ok, ""}
  end
end
