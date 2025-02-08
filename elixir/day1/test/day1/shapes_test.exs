defmodule Day1.ShapesTest do
  use ExUnit.Case, async: true

  describe "Day1.Shapes.hypoteneuse/2" do
    test "calculates the hypoteneuse of a right-angled triangle given the other two sides" do
      assert Day1.Shapes.hypoteneuse(3.0, 4.0) == 5.0
    end
  end
end
