defmodule RomanNumber do
  @moduledoc false

  @spec convert_roman_string_to_image(String.t()) :: {:ok, integer()} | {:error, String.t()}
  def convert_roman_string_to_image(roman_string) do
    s = String.upcase(roman_string)

    if String.match?(
         s,
         ~r/^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/u
       ) do
      {:ok, convert(String.codepoints(s), 0)}
    else
      {:error, "Not a roman number"}
    end
  end

  def convert(roman_string_list, acc) when roman_string_list == [] do
    acc
  end

  def convert([h | t], acc) when t == [] do
    # IO.inspect(binding())
    {add, list} = {value(h), t}
    # IO.inspect({add, list}, label: "ADD")
    convert(list, acc + add)
  end

  def convert([h | t], acc) do
    # IO.inspect(binding())
    [h2 | t2] = t
    # IO.inspect(h2, label: "H2")
    # IO.inspect(t2, label: "T2")
    {add, list} = if value(h) < value(h2), do: {value(h2) - value(h), t2}, else: {value(h), t}
    # IO.inspect({add, list}, label: "ADD")
    convert(list, acc + add)
  end

  defp value(string) do
    case string do
      "I" -> 1
      "V" -> 5
      "X" -> 10
      "L" -> 50
      "C" -> 100
      "D" -> 500
      "M" -> 1000
      _ -> 0
    end
  end
end
