defmodule Day1.Lists do
  def size([]), do: 0
  def size([_head | tail]), do: 1 + size(tail)

  def min([]), do: raise(ArgumentError, "Empty list")
  def min([head | tail]), do: do_min(tail, head)
  defp do_min([], acc), do: acc
  defp do_min([head | tail], acc) when head < acc, do: do_min(tail, head)
  defp do_min([_head | tail], acc), do: do_min(tail, acc)
end
