defmodule ImageprocessorTest do

  use ExUnit.Case

  @tag :dummy
  test "dummy" do
    assert true
  end

  @tag :gen_stage
  test "gen_stage pipeline" do
    Imageresizer.process(%{name: "warthog.jpg", id: "FE51EF"})
    Process.sleep(500)
  end

  @tag :broadway
  test "broadway pipeline" do
    Broadway.test_messages(RabbitBroadway, [%{name: "warthog.jpg", id: "S3R556"}])
    Process.sleep(500)
  end
end