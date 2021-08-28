defmodule BoundariesExample.LibraryHelperTest do
  use ExUnit.Case
  alias Common.Lib.Helper

  describe "validate/1" do
    test "valid data" do
      assert Helper.validate(["entity1"])
    end

    test "invalid data" do
      refute Helper.validate([])
    end
  end
end
