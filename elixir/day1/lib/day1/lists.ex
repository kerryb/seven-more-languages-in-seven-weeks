defmodule Day1.Lists do
  def size([]), do: 0
  def size([_head | tail]), do: 1 + size(tail)

  def min([]), do: raise(ArgumentError, "Empty list")
  def min([head | tail]), do: do_min(tail, head)
  defp do_min([], acc), do: acc
  defp do_min([head | tail], acc) when head < acc, do: do_min(tail, head)
  defp do_min([_head | tail], acc), do: do_min(tail, acc)

  def max([]), do: raise(ArgumentError, "Empty list")
  def max([head | tail]), do: do_max(tail, head)
  defp do_max([], acc), do: acc
  defp do_max([head | tail], acc) when head > acc, do: do_max(tail, head)
  defp do_max([_head | tail], acc), do: do_max(tail, acc)

  def word_count(list), do: do_wc(list, [])
  defp do_wc([], acc), do: acc
  defp do_wc([head | tail], acc), do: do_wc(tail, Keyword.update(acc, head, 1, &(&1 + 1)))
end
