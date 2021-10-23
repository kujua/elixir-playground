defmodule Common.Lib do
  @moduledoc false
  use Boundary, deps: [Common.Worker, Common.Lib.Helper], exports: []
  alias Common.Lib.Helper
  alias Common.Worker

  @spec get_data(atom) :: list
  def get_data(type) do
    # BoundariesExample.Cli.format_data(:error)

    data = Worker.data_access(type)

    if Helper.validate(data) do
      data
    else
      :error
    end
  end
end
