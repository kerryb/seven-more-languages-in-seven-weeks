defmodule Day1.TicTacToe.GameTest do
  use ExUnit.Case, async: true

  import Day1.TicTacToe.TestHelper

  alias Day1.TicTacToe.Game

  describe "Day1.TicTacToe.Game.best_move/2" do
    test "Immediately wins if possible" do
      board =
        board("""
        xx.
        o..
        oo.
        """)

      assert Game.best_move(board, :x) == :ne
    end

    test "Blocks an opponent from winning if possible and there’s no immediate winning move" do
      board =
        board("""
        xx.
        o..
        o..
        """)

      assert Game.best_move(board, :o) == :ne
    end
  end
end
