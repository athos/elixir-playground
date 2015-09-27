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
    def encode(xs) do
      P09.pack(xs) |> Enum.map fn ([t | _] = ys) -> {Enum.count(ys), t} end
    end
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

  defmodule P12 do
    def decode(xs) do
      Stream.flat_map(xs, fn x ->
        case x do
          {n, a} -> Stream.cycle([a]) |> Enum.take(n)
          _ -> [x]
        end
      end)
      |> Enum.into([])
    end
  end

  defmodule P13 do
    def encode_direct([]), do: []
    def encode_direct([x | xs]), do: _encode(x, xs, 1, [])

    defp _encode(t, [], n, ys), do: Enum.reverse(_add(n, t, ys))
    defp _encode(t, [t | xs], n, ys), do: _encode(t, xs, n+1, ys)
    defp _encode(t, [x | xs], n, ys), do: _encode(x, xs, 1, _add(n, t, ys))

    defp _add(1, t, ys), do: [t | ys]
    defp _add(n, t, ys), do: [{n, t} | ys]
  end

  defmodule P14 do
    def dupli(xs) do
      Stream.flat_map(xs, &[&1, &1]) |> Enum.into([])
    end
  end

  defmodule P15 do
    def repli(xs, n) do
      Stream.flat_map(xs, &Enum.take(Stream.cycle([&1]), n)) |> Enum.into([])
    end
  end

  defmodule P16 do
    def drop(xs, n), do: _drop(xs, n, n, [])
    defp _drop([], _, _, ys), do: Enum.reverse ys
    defp _drop([_ | xs], n, 1, ys), do: _drop(xs, n, n, ys)
    defp _drop([x | xs], n, i, ys), do: _drop(xs, n, i-1, [x | ys])
  end

  defmodule P17 do
    def split(xs, n), do: _split(xs, n, [])
    defp _split([x | xs], 1, ys), do: {Enum.reverse([x | ys]), xs}
    defp _split([x | xs], n, ys), do: _split(xs, n-1, [x | ys])
    #def split(xs, n), do: {Enum.take(xs, n), Enum.drop(xs, n)}
  end

  defmodule P18 do
    def slice(xs, m, n) do
      xs |> Enum.drop(m-1) |> Enum.take(n-m+1)
    end
    #def slice(xs, m, n), do: Enum.slice(xs, m-1, n-m+1)
  end

  defmodule P19 do
    def rotate(xs, n) do
      if n >= 0 do
        Enum.drop(xs, n) ++ Enum.take(xs, n)
      else
        len = Enum.count xs
        Enum.drop(xs, len+n) ++ Enum.take(xs, len+n)
      end
    end
  end

  defmodule P20 do
    def remove_at(xs, n), do: _remove_at(xs, n, [])
    defp _remove_at([_ | xs], 1, ys), do: Enum.reduce ys, xs, &[&1 | &2]
    defp _remove_at([x | xs], n, ys), do: _remove_at(xs, n-1, [x | ys])
    #def remove_at(xs, n), do: Enum.take(xs, n-1) ++ Enum.drop(xs, n)
  end

  defmodule P21 do
    def insert_at(xs, z, n), do: _insert_at(xs, z, n, [])
    defp _insert_at(xs, z, 1, ys), do: Enum.reduce ys, [z | xs], &[&1 | &2]
    defp _insert_at([x | xs], z, n, ys), do: _insert_at(xs, z, n-1, [x | ys])
  end
end
