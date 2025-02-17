defmodule Day1.SentencesTest do
  use ExUnit.Case, async: true

  describe "Day1.Sentences.traverse/1" do
    test "converts nested tuples to indented output" do
      # This is non-idiomatic Elixir, and would usually be a List.
      assert Day1.Sentences.traverse(
               {"See Spot.", {"See Spot sit.", "See Spot run.", {"See Spot run away.", "Come back Spot!"}},
                "Can’t see Spot."}
             ) == """
             See Spot.
               See Spot sit.
               See Spot run.
                 See Spot run away.
                 Come back Spot!
             Can’t see Spot.
             """
    end
  end
end
