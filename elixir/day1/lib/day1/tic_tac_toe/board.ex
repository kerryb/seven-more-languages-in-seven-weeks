defmodule Day1.TicTacToe.Board do
  defstruct [:nw, :n, :ne, :w, :c, :e, :sw, :s, :se]

  def state(_board, _player), do: :win
end
