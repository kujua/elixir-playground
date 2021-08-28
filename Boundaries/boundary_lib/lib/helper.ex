defmodule Library.Helper do
  @moduledoc false
  use Boundary, deps: [], exports: [], top_level?: true

  def out_bound do
    :world
  end
end
