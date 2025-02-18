defmodule Day1.TicTacToe.Game do
  @moduledoc false
  alias Day1.TicTacToe.Board

  def best_move(board, player) do
    win(board, player) || win(board, opponent(player))
  end

  defp win(board, player) do
    moves = board |> Board.available() |> Map.new(&{&1, Board.play(board, &1, player)})

    case Enum.find(moves, fn {_position, move} -> Board.state(move, player) == :win end) do
      {position, _state} -> position
      _ -> nil
    end
  end

  defp opponent(:x), do: :o
  defp opponent(:o), do: :x
end
