defmodule PEchoWorker do

  @moduledoc false
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, %{}}
  end

  def handle_call({:send, msg}, _from, _state) do
    POutput.receive_message(msg)
    {:reply, :ok, msg}
  end

  def send_to_output(value), do: GenServer.call(__MODULE__, {:send, value})
end