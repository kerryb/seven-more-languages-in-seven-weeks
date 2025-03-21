defmodule States.VideoStore.Server do
  @moduledoc false
  use GenServer

  alias States.VideoStore.Repo
  alias States.VidStore

  require VidStore

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: :video_store)
  end

  @impl true
  def init(_) do
    {:ok, nil}
  end

  @impl true
  def handle_call({action, item}, _from, state) do
    {:ok, video} = Repo.get(item)
    new_video = apply(VidStore, action, [video])
    Repo.update(item, new_video)
    {:reply, new_video, state}
  end
end
