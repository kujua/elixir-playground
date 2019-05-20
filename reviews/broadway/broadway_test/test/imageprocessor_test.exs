defmodule Imageprocessor do

  use ExUnit.Case
  use Broadway
  
  test "dummy" do
    assert true
  end

  test "gen_stage pipeline" do
    {:ok, a} = GenStage.start_link(Imageresizer, %{name: "filename"})   # starting from zero
    {:ok, b} = GenStage.start_link(Imagewatermark, %{})   # expand by 2
    {:ok, c} = GenStage.start_link(Exporter, :ok) # state does not matter

    {:ok, _} = GenStage.sync_subscribe(b, to: a)
    {:ok, _} = GenStage.sync_subscribe(c, to: b)

    Process.sleep(500)
  end

  test "broadway pipeline" do
#    {:ok,bw} = GenServer.start_link(BroadwayTest,[])
    ref = Broadway.test_messages(RabbitBroadway, [%{name: "filename-broadway"}])
#    assert_receive {:ack, ^ref, successful, failed}
#    assert length(successful) == 3
#    assert length(failed) == 0

#    Process.sleep(500)
  end
end