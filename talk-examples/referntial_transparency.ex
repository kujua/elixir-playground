defmodule ReferntialTransparency do
  @moduledoc false

  def get_datetime do
    Timex.DateTime.now |> Timex.format!("{ISO:Extended}")
  end

  def return_number(n) when is_number(n) do
    n
  end

  return_number(42) # -> 42

  c = doubler
  c.("a")
  # ** (FunctionClauseError) no function clause matching

  def multiply(x, y)
      when is_number(x) and is_number(y)
    do
    x*y
  end

  def double() do
    fn x when is_number(x)
    -> multiply(2,x) end
  end

end
