defmodule PSourceWorker do
  @moduledoc false

  use GenServer

  def start_link(msg) do
    GenServer.start_link(__MODULE__, "")
  end

  def init(_opts) do
    {:ok, %{}}
  end

#  def handle_call(_msg, _from, state) do
#    {:reply, :ok, state}
#  end

  def handle_call({:echo, state}, _from, _state) do
    PEcho.echo_message("Hello")
    {:reply, :ok, state}
  end
  
#  def handle_cast(_msg, state) do
#    {:noreply, state}
#  end
end