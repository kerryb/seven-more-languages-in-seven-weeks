defmodule Day1.TicTacToe.Board do
  defstruct [:nw, :n, :ne, :w, :c, :e, :sw, :s, :se]

  def state(_board, :X), do: :win
  def state(_board, :O), do: :lose
end
