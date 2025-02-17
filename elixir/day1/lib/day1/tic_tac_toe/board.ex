defmodule Day1.TicTacToe.Board do
  @moduledoc false
  @positions [:nw, :n, :ne, :w, :c, :e, :sw, :s, :se]
  defstruct @positions

  def lines do
    [
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

  def available(board) do
    Enum.reject(@positions, &Map.get(board, &1))
  end

  def play(board, position, player) do
    Map.put(board, position, player)
  end

  def state(board, player) do
    Enum.reduce_while(lines(), :playing, fn line, _acc -> check_line(board, line, player) end)
  end

  defp check_line(board, line, player) do
    case board |> Map.take(line) |> Map.values() do
      [^player, ^player, ^player] -> {:halt, :win}
      [opponent, opponent, opponent] -> {:halt, :lose}
      _ -> {:cont, :playing}
    end
  end
end
