defmodule States.VideoStore do
  @moduledoc false
  def renting(video) do
    vid = log(video, "Renting #{video.title}")
    %{vid | times_rented: video.times_rented + 1}
  end

  def returning(video), do: log(video, "Returning #{video.title}")

  def losing(video), do: log(video, "Losing #{video.title}")

  def finding(video), do: log(video, "Finding #{video.title}")

  defp log(video, message) do
    %{video | log: [message | video.log]}
  end
end
