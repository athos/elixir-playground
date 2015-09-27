defmodule L99InElixirTest do
  use ExUnit.Case
  doctest L99InElixir
  alias L99InElixir, as: L

  test "Find the last box of a list." do
    assert L.P01.my_last([:a, :b, :c, :d]) == :d
  end

  test "Find the last but one box of a list." do
    assert L.P02.my_but_last([:a, :b, :c, :d]) == [:c, :d]
  end

  test "Find the K'th element of a list." do
    assert L.P03.element_at([:a, :b, :c, :d, :e], 3) == :c
  end
end
