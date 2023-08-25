defmodule MathsTest do
  use ExUnit.Case
  doctest Maths

  test "greets the world" do
    assert Maths.hello() == :world
  end
end
