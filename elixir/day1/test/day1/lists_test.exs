defmodule Day1.ListsTest do
  use ExUnit.Case, async: true

  describe "Day1.Lists.size/1" do
    test "returns the length of a list" do
      assert Day1.Lists.size([1, 2, 3, :foo, nil, [4, 5]]) == 6
    end
  end
end
