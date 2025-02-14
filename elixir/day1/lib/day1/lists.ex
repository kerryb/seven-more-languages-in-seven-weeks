defmodule Day1.Lists do
  def size([]), do: 0
  def size([_head | tail]), do: 1 + size(tail)
end
