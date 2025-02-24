defmodule Day1.Lists do
  @moduledoc false
  def size([]), do: 0
  def size([_head | tail]), do: 1 + size(tail)

  def minimum([]), do: raise(ArgumentError, "Empty list")
  def minimum([head | tail]), do: minimum(tail, head)

  defp minimum([], acc), do: acc
  defp minimum([head | tail], acc) when head < acc, do: minimum(tail, head)
  defp minimum([_head | tail], acc), do: minimum(tail, acc)

  def maximum([]), do: raise(ArgumentError, "Empty list")
  def maximum([head | tail]), do: maximum(tail, head)

  defp maximum([], acc), do: acc
  defp maximum([head | tail], acc) when head > acc, do: maximum(tail, head)
  defp maximum([_head | tail], acc), do: maximum(tail, acc)

  def word_count(list), do: word_count(list, [])

  defp word_count([], acc), do: acc
  defp word_count([head | tail], acc), do: word_count(tail, Keyword.update(acc, head, 1, &(&1 + 1)))
end
