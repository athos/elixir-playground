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

  test "Find the number of elements of a list." do
    assert L.P04.length([:a, :b, :c]) == 3
  end

  test "Reverse a list." do
    assert L.P05.reverse([:a, :b, :c, :d]) == [:d, :c, :b, :a]
  end

  test "Find out whether a list is a palindrome." do
    assert L.P06.palindrome?([1, 2, 3, 2, 1])
    assert L.P06.palindrome?([1, 2, 3, 3, 2, 1])
    assert !L.P06.palindrome?([1, 2, 3, 2, 4])
  end

  test "Flatten a nested list structure." do
    assert L.P07.my_flatten([:a, [:b, [:c, :d], :e]]) == [:a, :b, :c, :d, :e]
  end

  test "Eliminate consecutive duplicates of list elements." do
    assert L.P08.compress([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [:a, :b, :c, :a, :d, :e]
  end
end
