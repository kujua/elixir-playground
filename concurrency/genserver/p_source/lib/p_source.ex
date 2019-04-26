defmodule PSource do
  @moduledoc """
  Documentation for PSource.
  """

  @doc """
  Hello world.
  """
  def send_to_echo do
    {:ok, pid} = PSourceWorker.start_link("")
    GenServer.call(pid, {:echo, "Hello"})
  end
end
