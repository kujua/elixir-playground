defmodule SalesByMatch do
  @moduledoc false

  def solution(array_length, array) do
    split_array = array
        |> String.split(" ")
        |> Enum.map(fn n -> String.to_integer(String.trim(n)) end)
    array_length = String.to_integer(String.trim(array_length))
    if array_length == Enum.count(split_array) do
      split_array
        |> frequencies
        |> Map.values
        |> Enum.reduce(0, fn x, acc -> if (x > 1), do: div(x,2) + acc, else: acc end)
    else
      IO.puts "Array length is not array count"
    end
  end

  def frequencies(arr) do
    Enum.reduce(arr, %{}, fn key, acc ->
      case acc do
        %{^key => value} -> %{acc | key => value + 1}
        %{} -> Map.put(acc, key, 1)
      end
    end)
  end

  def main do
    array_length = IO.read(:stdio, :line)
    array = IO.read(:stdio, :line)
    result = solution array_length, array
    IO.puts result
  end
end
