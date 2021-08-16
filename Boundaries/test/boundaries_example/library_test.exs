defmodule BoundariesExample.LibraryTest do
  use ExUnit.Case
  alias Common.Lib

  describe "get_data/1" do
    test ":all" do
      assert Lib.get_data(:all) == ["entity 1"]
    end

    test "unknown type" do
      assert Lib.get_data(:notvalid) == :error
    end
  end
end
