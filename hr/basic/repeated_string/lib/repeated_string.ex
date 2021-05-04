defmodule RepeatedString do
  @moduledoc false

  def solution(string_input, infinite_string_length) do
    input_length = String.length(String.trim(string_input))
    IO.inspect input_length, label: "input_length"
    max_string_length = div(String.to_integer(String.trim(infinite_string_length)), input_length)
    IO.inspect max_string_length, label: "max_string_length"
    String.trim(string_input)
    |> String.duplicate(max_string_length)
    # |> String.slice(0..max_string_length)
    |> String.graphemes
    |> Enum.count(& &1 == "a")
  end

  def main do
    string_input = IO.read(:stdio, :line)
    infinite_string_length = IO.read(:stdio, :line)
    result = solution string_input, infinite_string_length
    IO.puts result
  end
end
