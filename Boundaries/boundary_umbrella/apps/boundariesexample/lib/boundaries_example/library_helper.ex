defmodule Common.Lib.Helper do
  @moduledoc false

  use Boundary, deps: [], exports: [], top_level?: true

  @spec validate(list()) :: boolean()
  def validate(data) do
    # Common.Lib.get_data :all
    # BoundariesExample.Cli.format_data []
    # Common.Worker.data_access :all

    not Enum.empty?(data)
  end
end
