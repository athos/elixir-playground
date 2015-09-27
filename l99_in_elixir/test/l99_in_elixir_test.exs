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

  test "Pack consecutive duplicates of list elements into sublists." do
    assert L.P09.pack([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [[:a, :a, :a, :a], [:b], [:c, :c], [:a, :a], [:d], [:e, :e, :e, :e]]
  end

  test "Run-length encoding of a list." do
    assert L.P10.encode([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [{4, :a}, {1, :b}, {2, :c}, {2, :a}, {1, :d}, {4, :e}]
  end

  test "Modified run-length encoding." do
    assert L.P11.encode_modified([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]
  end

  test "Decode a run-length encoded list." do
    xs = [:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]
    assert L.P12.decode(L.P11.encode_modified(xs)) == xs
  end

  test "Run-length encoding of a list (direct solution)." do
    assert L.P13.encode_direct([:a, :a, :a, :a, :b, :c, :c, :a, :a, :d, :e, :e, :e, :e]) == [{4, :a}, :b, {2, :c}, {2, :a}, :d, {4, :e}]
  end

  test "Duplicate the elements of a list." do
    assert L.P14.dupli([:a, :b, :c, :c, :d]) == [:a, :a, :b, :b, :c, :c, :c, :c, :d, :d]
  end

  test "Replicate the elements of a list a given number of times." do
    assert L.P15.repli([:a, :b, :c], 3) == [:a, :a, :a, :b, :b, :b, :c, :c, :c]
  end
end
