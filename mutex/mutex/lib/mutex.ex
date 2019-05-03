defmodule Mutex do
  @moduledoc """
  Documentation for Mutex.
  """
  # public interface
  def signal(mutex_pid) do
    send mutex_pid, {:signal, self()}
    receive do
      :ok -> :ok
    end
  end

  def free(mutex_pid) do
    send mutex_pid, {:free, self()}
    receive do
      :ok -> :ok
    end
  end

  # "server" interface
  def start() do
    spawn(__MODULE__, :init, [])
  end

  def init() do
    free()
  end

  def lock(caller) do
    receive do
      {:free, caller} ->
        send caller, :ok
        free()
    end
  end

  def free() do
    receive do
      {:signal, caller} ->
        send caller, :ok
        lock(caller)
    end
  end
end
