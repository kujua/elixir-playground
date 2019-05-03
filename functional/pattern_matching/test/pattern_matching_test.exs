defmodule PatternMatchingTest do
  use ExUnit.Case
  doctest PatternMatching

  test "greets the world" do
    assert PatternMatching.hello() == :world
  end

  test "chain matching" do
    {_,value} = {:ok,5} = {:ok, 5}
    assert (value == 5)
  end
end
