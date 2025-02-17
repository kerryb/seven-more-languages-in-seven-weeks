defmodule Day1.TicTacToe.BoardTest do
  use ExUnit.Case, async: true

  import Day1.TicTacToe.TestHelper

  alias Day1.TicTacToe.Board

  describe "Day1.TicTacToe.Board.lines/0" do
    test "returns the combinations of positions that constitute a line" do
      assert Board.lines() == [
               [:nw, :n, :ne],
               [:w, :c, :e],
               [:sw, :s, :se],
               [:nw, :w, :sw],
               [:n, :c, :s],
               [:ne, :e, :se],
               [:nw, :c, :se],
               [:ne, :c, :sw]
             ]
    end
  end

  describe "Day1.TicTacToe.Board.available/1" do
    test "returns the positions available to play in" do
      board =
        board("""
        xo.
        ox.
        oox
        """)

      assert Board.available(board) == [:ne, :e]
    end
  end

  describe "Day1.TicTacToe.Board.play/3" do
    test "makes a mark in the specified positions" do
      board =
        board("""
        xo.
        ox.
        oxo
        """)

      assert Board.play(board, :ne, :x) ==
               board("""
               xox
               ox.
               oxo
               """)
    end
  end

  describe "Day1.TicTacToe.Board.state/2" do
    test "returns :win if the current player has a line" do
      board =
        board("""
        xo.
        ox.
        oox
        """)

      assert Board.state(board, :x) == :win
    end

    test "returns :lose if the other player has a line" do
      board =
        board("""
        xo.
        ox.
        oox
        """)

      assert Board.state(board, :o) == :lose
    end

    test "returns :playing if neither player has a line" do
      board =
        board("""
        xo.
        ox.
        oxo
        """)

      assert Board.state(board, :o) == :playing
    end
  end
end
