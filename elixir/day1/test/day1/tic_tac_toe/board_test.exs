defmodule Day1.TicTacToe.BoardTest do
  use ExUnit.Case, async: true
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

  describe "Day1.TicTacToe.Board.state/2" do
    test "returns :win if the current player has a line" do
      board =
        board("""
        XO.
        OX.
        OOX
        """)

      assert Board.state(board, :x) == :win
    end

    test "returns :lose if the other player has a line" do
      board =
        board("""
        XO.
        OX.
        OOX
        """)

      assert Board.state(board, :o) == :lose
    end

    test "returns :playing if neither player has a line" do
      board =
        board("""
        XO.
        OX.
        OXO
        """)

      assert Board.state(board, :o) == :playing
    end

    defp board(string) do
      [nw, n, ne, w, c, e, sw, s, se] =
        string
        |> String.replace(~r/\s+/, "")
        |> String.codepoints()
        |> Enum.map(&(&1 |> String.downcase() |> String.to_atom()))

      %Board{nw: nw, n: n, ne: ne, w: w, c: c, e: e, sw: sw, s: s, se: se}
    end
  end
end
