defmodule L99InElixirTest do
  use ExUnit.Case
  doctest L99InElixir
  alias L99InElixir, as: L

  test "Find the last box of a list." do
    assert L.P01.my_last([:a, :b, :c, :d]) == :d
  end
end
