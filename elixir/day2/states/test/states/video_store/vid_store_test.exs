defmodule States.VideoStore.VidStoreTest do
  use ExUnit.Case, async: true

  alias States.Video
  alias States.VidStore

  describe "States.VidStore.rent/1" do
    test "sets the state to :rented" do
      rented_video = VidStore.rent(video())
      assert rented_video.state == :rented
    end

    test "updates the rental count" do
      rented_video = VidStore.rent(video())
      assert rented_video.times_rented == 1
    end

    test "logs the transition" do
      rented_video = VidStore.rent(video())
      assert Enum.count(rented_video.log) == 1
    end
  end

  describe "States.VidStore" do
    test "handles multiple transitions" do
      vid =
        video()
        |> VidStore.rent()
        |> VidStore.return()
        |> VidStore.rent()
        |> VidStore.return()
        |> VidStore.rent()

      assert Enum.count(vid.log) == 5
      assert vid.times_rented == 3
    end
  end

  defp video, do: %Video{title: "XMen"}
end
