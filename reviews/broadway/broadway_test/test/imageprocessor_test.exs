defmodule Imageprocessor do

  use ExUnit.Case

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
    {:ok, a} = GenStage.start_link(Imageresizer, %{name: "filename2"})   # starting from zero
    {:ok, b} = GenStage.start_link(Imagewatermark, %{})   # expand by 2
    {:ok, c} = GenStage.start_link(Exporter, :ok) # state does not matter

    {:ok, _} = GenStage.sync_subscribe(b, to: a)
    {:ok, _} = GenStage.sync_subscribe(c, to: b)

    Process.sleep(500)
  end
end