defmodule States.VideoStore.VideoStoreTest do
  alias States.VideoStore.Video
  alias States.VideoStore
  use ExUnit.Case, async: true

  describe "States.VideoStore.renting/1" do
    test "updates the rental count" do
      rented_video = VideoStore.renting(video())
      assert rented_video.times_rented == 1
    end
  end

  defp video, do: %Video{title: "XMen"}
end
