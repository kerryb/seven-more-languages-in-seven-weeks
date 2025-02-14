defmodule Day1.ListsTest do
  use ExUnit.Case, async: true

  describe "Day1.Lists.size/1" do
    test "returns the length of a list" do
      assert Day1.Lists.size([1, 2, 3, :foo, nil, [4, 5]]) == 6
    end
  end

  describe "Day1.Lists.min/1" do
    test "returns the minimum value of a list" do
      assert Day1.Lists.min([4, 2, 1, 3]) == 1
    end

    test "raises an exception for an empty list" do
      assert_raise ArgumentError, "Empty list", fn -> Day1.Lists.min([]) end
    end
  end

  describe "Day1.Lists.max/1" do
    test "returns the maximum value of a list" do
      assert Day1.Lists.max([2, 4, 1, 3]) == 4
    end

    test "raises an exception for an empty list" do
      assert_raise ArgumentError, "Empty list", fn -> Day1.Lists.max([]) end
    end
  end

  describe "Day1.Lists.word_count/1" do
    test "returns a keyword list of atoms to occurrence counts" do
      # This is non-idiomatic Elixir, and would usually be a Map.
      assert Day1.Lists.word_count([:to, :be, :or, :not, :to, :be]) == [
               to: 2,
               be: 2,
               or: 1,
               not: 1
             ]
    end
  end
end
