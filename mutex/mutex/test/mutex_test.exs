defmodule MutexTest do
  use ExUnit.Case
  doctest Mutex

  test "Test Mutex" do
    mpid = Mutex.start()
    assert(:ok == Mutex.signal(mpid))
    assert(:ok == Mutex.free(mpid))
  end

  test "Blocked" do
    mpid = Mutex.start()
    parent = self()

    spawn_link(fn ->
      Mutex.signal(mpid)
      send parent, :ready
#      :timer.sleep(500)
      Mutex.free(mpid)
     end)

    assert_receive :ready
    assert(:ok == Mutex.signal(mpid))
  end
end
