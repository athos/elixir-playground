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

  defmodule P04 do
    def length(xs), do: _length(xs, 0)
    def _length([], n), do: n
    def _length([_ | xs], n) do
      _length xs, n+1
    end
    #def length(xs), do: Enum.count xs
  end

  defmodule P05 do
    def reverse(xs), do: _reverse(xs, [])
    def _reverse([], ys), do: ys
    def _reverse([x | xs], ys) do
      _reverse(xs, [x | ys])
    end
    #def reverse(xs), do: Enum.reverse xs
  end
end
