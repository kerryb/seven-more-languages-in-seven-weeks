defmodule States.VideoStore.DETS do
  @moduledoc false
  alias States.VidStore

  require VidStore

  def start_link(_) do
    {:ok, _} = :dets.open_file(:videos, [])
  end

  def add(item, video), do: :dets.insert(:videos, {item, video})
  def rent(item), do: perform(:rent, item)
  def return(item), do: perform(:return, item)
  def lose(item), do: perform(:lose, item)
  def find(item), do: perform(:find, item)

  defp perform(action, item) do
    [{^item, video}] = :dets.lookup(:videos, item)
    new_video = apply(VidStore, action, [video])
    :dets.insert(:videos, {item, new_video})
    new_video
  end
end
