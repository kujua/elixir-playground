defmodule BoundariesExample.Cli do
  @moduledoc false

  use Boundary, deps: [Common.Lib, Library], exports: []
  alias Common.Lib

  @spec main(list) :: :ok
  def main(_args \\ []) do
    Library.in_bound()
    # Library.Helper.out_bound() # This is not allowed

    Lib.get_data(:all)
    |> format_data()
    |> IO.puts()
  end

  @spec format_data(list() | :error) :: list() | String.t()
  def format_data(data) do
    # Common.Worker.data_access(:all)
    # Common.Lib.Helper.validate([])

    case data do
      :error -> "No Result"
      _ -> data
    end
  end
end
