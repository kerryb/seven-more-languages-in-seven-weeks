defmodule States.VideoStore.Agent do
  @moduledoc false
  use Agent

  alias States.VidStore

  require VidStore

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add(item, video), do: Agent.update(__MODULE__, &Map.put(&1, item, video))
  def rent(item), do: perform(:rent, item)
  def return(item), do: perform(:return, item)
  def lose(item), do: perform(:lose, item)
  def find(item), do: perform(:find, item)

  defp perform(action, item) do
    Agent.get_and_update(__MODULE__, fn videos ->
      video = videos[item]
      new_video = apply(VidStore, action, [video])
      {new_video, Map.put(videos, item, new_video)}
    end)
  end
end
