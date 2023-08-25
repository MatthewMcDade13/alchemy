defmodule Common do
  @spec factors(integer()) :: list(integer)
  def factors(n) when is_number(n) do
    n..2
    |> Enum.reduce([], fn x, acc ->
      if rem(n, x) == 0 do
        [x | acc]
      else
        acc
      end
    end)

    # _factors(n, n, [])
  end

  @spec gcf(integer(), integer()) :: integer()
  def gcf(a, b) when is_number(a) and is_number(b) do
    afs = factors(a)
    bfs = factors(b)

    Enum.reverse(afs) |> Enum.find(nil, fn x -> Enum.any?(bfs, fn y -> x == y end) end)
  end
end
