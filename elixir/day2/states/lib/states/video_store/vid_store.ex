defmodule States.VidStore do
  @moduledoc false

  use States.StateMachine

  state(:available,
    rent: [to: :rented, calls: [&__MODULE__.renting/1]]
  )

  state(:rented,
    return: [to: :available, calls: [&__MODULE__.returning/1]],
    lose: [to: :lost, calls: [&__MODULE__.losing/1]]
  )

  state(:lost,
    find: [to: :found, calls: [&__MODULE__.finding/1]]
  )

  state(:found, [])

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
