defmodule Common.Worker do
  @moduledoc false

  use Boundary, deps: [], exports: [], top_level?: true

  @spec data_access(atom) :: list
  def data_access(type) do
    # BoundariesExample.Cli.format_data([])
    # Common.Lib.get_data(:all)
    # Common.Lib.Helper.validate([])

    case type do
      :all -> ["entity 1"]
      _ -> []
    end
  end
end
