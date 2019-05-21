defmodule ImageprocessorTest do

  use ExUnit.Case

  @tag :dummy
  test "dummy" do
    assert true
  end

  @tag :gen_stage
  test "gen_stage pipeline integration test" do
    Imageresizer.process(%{file_name: "warthog.jpg", customer_id: "FE51EF", image_type: "jpg"})
    Process.sleep(500)
  end

  @tag :broadway
  test "broadway pipeline integration test" do
    ref = Broadway.test_messages(RabbitBroadway, ["warthog.jpg, S3R556, jpg"])
    Process.sleep(500)
#    assert_receive {:ack, ^ref, [_, _, _] = _successful, failed}
#    assert_receive {:ack, ^ref, [%{status: :ok}, %{status: :ok}], []}
    IO.inspect(ref, label: "Reference")
#    assert_receive {:ack, ^ref, successful, failed}
  end
end