defmodule HigherOrderFunctions do
  @moduledoc false


  def sum(list) do
    sum = fn(x, y) -> x + y end
    list |> Enum.reduce(0, sum)
  end

  def Filter do
    Enum.Filter([1, 2, 3], func)
                        Keyword.get_and_update([a: 1], :a, func
             Enum.reverse([1, 2, 3])

  end

def sum([]), do: 0
def sum([head | tail]), do: head + sum(tail)

  def create_from_record do
    fn (d) -> documentrecord(docid: documentrecord(d,:docid)+1, name: documentrecord(d,:name)) end
  end

  defmodule HigherOrderFunctions do
    def call_function(function,a) do
      function.(a)
    end

    def call_with_fn() do
      call_function(fn n -> n*n end,5)
    end

    def call_with_variable() do
      sqfunc = fn n -> n*n end
      call_function(sqfunc,4)
    end

    def direct_call() do
      fn n -> n*n end.(3)
    end

    def call_with_variable_shorthand() do
      sqfunc = &(&1*&1)
      call_function(sqfunc,4)
    end

    def direct_call_shorthand() do
      (&(&1*&1)).(3)
    end
  end

  defmodule Currying do
    def multiply(x,y) do
      x*y
    end

    def doubler() do
      fn x -> multiply(2,x) end
    end

    def curry() do
      c = doubler()
      c.(21)
    end
  end



end
