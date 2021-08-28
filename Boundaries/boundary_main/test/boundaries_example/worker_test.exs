defmodule BoundariesExample.WorkerTest do
  use ExUnit.Case
  alias Common.Worker

  describe "data_access/1" do
    test ":all" do
      assert Worker.data_access(:all) == ["entity 1"]
    end

    test "unknown type" do
      assert Worker.data_access(:notvalid) == []
    end
  end
end
