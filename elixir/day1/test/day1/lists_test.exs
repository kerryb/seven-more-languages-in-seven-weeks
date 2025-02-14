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
end
