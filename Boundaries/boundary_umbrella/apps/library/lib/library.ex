defmodule Library do
  @moduledoc false
  use Boundary, deps: [Library.Helper], exports: []

  def in_bound do
    Library.Helper.out_bound()
  end
end
