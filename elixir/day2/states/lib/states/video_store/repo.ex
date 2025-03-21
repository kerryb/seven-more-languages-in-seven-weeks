defmodule States.VideoStore.Repo do
  @moduledoc false
  use GenServer

  alias States.VidStore

  require VidStore

  def start_link(_arg) do
    GenServer.start_link(__MODULE__, %{}, name: :repo)
  end

  def add(item, video), do: GenServer.cast(:repo, {:add, item, video})
  def get(item), do: GenServer.call(:repo, {:get, item})
  def update(item, video), do: GenServer.cast(:repo, {:update, item, video})

  @impl true
  def init(videos) do
    {:ok, videos}
  end

  @impl true
  def handle_cast({:add, item, video}, videos) do
    {:noreply, Map.put(videos, item, video)}
  end

  def handle_cast({:update, item, video}, videos) do
    {:noreply, Map.put(videos, item, video)}
  end

  def handle_cast(_, videos), do: {:noreply, videos}

  @impl true
  def handle_call({:get, item}, _from, videos) do
    result =
      case videos[item] do
        nil -> {:error, "Video #{inspect(item)} not found"}
        video -> {:ok, video}
      end

    {:reply, result, videos}
  end

  def handle_call(message, _from, videos) do
    {:reply, {:error, "Unexpected message #{inspect(message)}"}, videos}
  end
end
