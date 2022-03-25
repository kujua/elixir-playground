defmodule RomanNumberTest do
  use ExUnit.Case
  import RomanNumber

  test "convert_roman_string_to_image/1" do
    {:ok, ret} = convert_roman_string_to_image("IV")
    assert ret == 4
    {:ok, ret} = convert_roman_string_to_image("VI")
    assert ret == 6
    {:ok, ret} = convert_roman_string_to_image("MCMXXII")
    assert ret == 1922
    {:ok, ret} = convert_roman_string_to_image("MMXXII")
    assert ret == 2022
  end

  test "convert_roman_string_to_image/1 no roman number" do
    {:error, "Not a roman number"} = convert_roman_string_to_image("VI2")
  end
end
