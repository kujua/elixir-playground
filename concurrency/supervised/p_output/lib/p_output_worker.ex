defmodule POutputWorker do
  @moduledoc false

  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, ""}
  end

  def handle_call({:send, msg}, _from, _state) do
    IO.puts(msg)
    {:reply, :ok, msg}
  end

  def send(value), do: GenServer.call(__MODULE__, {:send, value})
end
