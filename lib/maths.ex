defmodule Maths do
  import Quadratic.Trinomial
  import Common

  def factor(), do: factor_acb(10, 17, 3)
  def gcf(a, b), do: Common.gcf(a, b)
end

IO.inspect(Maths.factor())
# IO.puts(Maths.gcf(10, 30))
IO.puts("AYYEE")
