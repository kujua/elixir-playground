defmodule Recursion do
  @moduledoc false

  def get_nested_map_from_list(nm, nestedlevel) when nestedlevel < 1 do
    nm
  end

  def get_nested_map_from_list(nm, nestedlevel) do
    l = List.first(nm)
    get_nested_map_from_list(l,nestedlevel-1)
  end


end
