defmodule PSourceWorker do
  @moduledoc false

  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, %{}}
  end

#  def handle_call(_msg, _from, state) do
#    {:reply, :ok, state}
#  end

  def handle_call({:echo, msg}, _from, _state) do
    PEcho.echo_message(msg)
    {:reply, :ok, msg}
  end
  
#  def handle_cast(_msg, state) do
#    {:noreply, state}
#  end

  def echo(value), do: GenServer.call(__MODULE__, {:echo, value})
end