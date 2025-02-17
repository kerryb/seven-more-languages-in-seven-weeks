defmodule Day1.TicTacToe.TestHelper do
  @moduledoc false
  alias Day1.TicTacToe.Board

  def board(string) do
    [nw, n, ne, w, c, e, sw, s, se] =
      string
      |> String.replace(~r/\s+/, "")
      |> String.codepoints()
      |> Enum.map(fn
        "x" -> :x
        "o" -> :o
        _ -> nil
      end)

    %Board{nw: nw, n: n, ne: ne, w: w, c: c, e: e, sw: sw, s: s, se: se}
  end
end
