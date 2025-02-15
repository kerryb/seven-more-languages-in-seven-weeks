defmodule Day1.Sentences do
  def traverse(sentences), do: traverse(sentences, 0) <> "\n"

  defp traverse(sentence, indent) when is_binary(sentence),
    do: String.duplicate(" ", (indent - 1) * 2) <> sentence

  defp traverse(sentence, indent),
    do: sentence |> Tuple.to_list() |> Enum.map_join("\n", &traverse(&1, indent + 1))
end
