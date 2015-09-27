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
    defp _length([], n), do: n
    defp _length([_ | xs], n) do
      _length xs, n+1
    end
    #def length(xs), do: Enum.count xs
  end

  defmodule P05 do
    def reverse(xs), do: _reverse(xs, [])
    defp _reverse([], ys), do: ys
    defp _reverse([x | xs], ys) do
      _reverse(xs, [x | ys])
    end
    #def reverse(xs), do: Enum.reverse xs
  end

  defmodule P06 do
    def palindrome?(xs) do
      xs == Enum.reverse(xs)
    end
  end

  defmodule P07 do
    def my_flatten(xs), do: _my_flatten(xs, [])
    defp _my_flatten([], ys), do: ys
    defp _my_flatten([x | xs], ys) do
      flattened = if is_list(x), do: my_flatten(x), else: [x]
      ys ++ flattened ++ my_flatten(xs)
    end
    #def my_flatten(xs), do: List.flatten xs
  end

  defmodule P08 do
    def compress([]), do: []
    def compress([x | xs]), do: _compress(x, xs, [x])
    defp _compress(_, [], ys), do: Enum.reverse ys
    defp _compress(t, [t | xs], ys), do: _compress(t, xs, ys)
    defp _compress(_, [x | xs], ys), do: _compress(x, xs, [x | ys])
  end

  defmodule P09 do
    def pack([]), do: []
    def pack([x | xs]), do: _pack(x, xs, [x], [])
    defp _pack(_, [], acc, ys), do: Enum.reverse [acc | ys]
    defp _pack(t, [t | xs], acc, ys), do: _pack(t, xs, [t | acc], ys)
    defp _pack(_, [x | xs], acc, ys), do: _pack(x, xs, [x], [acc | ys])
  end

  defmodule P10 do
    def encode([]), do: []
    def encode([x | xs]), do: _encode(x, xs, 1, [])
    defp _encode(t, [], n, ys), do: Enum.reverse [{n, t} | ys]
    defp _encode(t, [t | xs], n, ys), do: _encode(t, xs, n+1, ys)
    defp _encode(t, [x | xs], n, ys), do: _encode(x, xs, 1, [{n, t} | ys])
    # def encode(xs) do
    #   P09.pack(xs) |> Enum.map fn ([t | _] = ys) -> {Enum.count(ys), t} end
    # end
  end

  defmodule P11 do
    def encode_modified(xs) do
      P10.encode(xs) |> Enum.map fn x ->
        case x do
          {1, a} -> a
          _ -> x
        end
      end
    end
  end
end
