defmodule MutexGen do
  use GenServer

  def start_link(msg) do
    GenServer.start_link(__MODULE__, "", name: __MODULE__)
  end

  def init(_opts) do
    {:ok, :free}
  end

  def handle_call(:signal, {caller, _} = from, state) do
    {:reply, :ok, {:locked, caller}}
  end

  def handle_call(:free,  {_, caller} = state = from , state) do
    {:reply, :ok, {:free, caller}}
  end

  def lock(caller) do
    GenServer.call(__MODULE__, :signal)
  end

  def free() do
    GenServer.call(__MODULE__, :free)
  end
end
