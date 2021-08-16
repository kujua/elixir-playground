defmodule BoundariesExample.CliTest do
  use ExUnit.Case

  describe "format_data/1" do
    test ":all" do
      assert BoundariesExample.Cli.format_data(["entity 1"])
    end

    test "unknown type" do
      assert BoundariesExample.Cli.format_data(:error)
    end
  end
end
