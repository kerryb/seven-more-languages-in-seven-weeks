defmodule States.VideoStore do
  @moduledoc false

  def add(video), do: GenServer.cast(:video_store, {:add, video})
  def rent(video), do: GenServer.call(:video_store, {:rent, video})
  def return(video), do: GenServer.call(:video_store, {:return, video})
  def lose(video), do: GenServer.call(:video_store, {:lose, video})
  def find(video), do: GenServer.call(:video_store, {:find, video})
end
