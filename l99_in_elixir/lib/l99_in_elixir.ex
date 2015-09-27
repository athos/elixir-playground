defmodule L99InElixir do
  defmodule P01 do
    def my_last([x]), do: x
    def my_last([_ | xs]), do: my_last xs

    #def my_last(xs), do: Enum.at xs, -1
  end

  defmodule P02 do
    def my_but_last([_, _] = xs), do: xs
    def my_but_last([_ | xs]), do: my_but_last xs

    #def my_but_last(xs), do: Enum.slice xs, -2, 2
  end

  defmodule P03 do
    def element_at([x | _], 1), do: x
    def element_at([x | xs], n) do
      element_at(xs, n-1)
    end
    #def element_at(xs, n), do: Enum.at xs, n-1
  end
end
