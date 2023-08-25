defmodule Quadratic.Trinomial do
  import Common

  @spec factor_acb(integer(), integer(), integer()) :: String.t()
  def factor_acb(a, b, c) do
    ac = a * c

    ac_factors = factors(ac)
    operands = b_operands(ac_factors, b)

    cond do
      not is_nil(operands) and a == 1 ->
        {i, j} = operands

        "(x #{if i < 0 do
          "-"
        else
          "+"
        end} #{i})(x #{if j < 0 do
          "-"
        else
          "+"
        end} #{j})"

        #      not is_nil(operands) -> 
        # TODO :: Make a Mathematical variable type. 
        # with Coefficient field so we can factor mathematical expressions and do this part
    end

    if not is_nil(operands) do
    end

    if a == 1 do
      "(x #{})"
    else
    end
  end

  defp b_operands(ac_factors, b) do
    Enum.reverse(ac_factors)
    |> Enum.reduce_while(nil, fn rx, acc ->
      i =
        Enum.reduce_while(ac_factors, nil, fn x, acc ->
          cond do
            x + rx == b -> {:halt, {x, rx}}
            -x + rx == b -> {:halt, {-x, rx}}
            x + -rx == b -> {:halt, {x, -rx}}
            -x + -rx == b -> {:halt, {-x, -rx}}
            true -> {:cont, acc}
          end
        end)

      if i !== nil do
        {:halt, i}
      else
        {:cont, acc}
      end
    end)
  end
end
