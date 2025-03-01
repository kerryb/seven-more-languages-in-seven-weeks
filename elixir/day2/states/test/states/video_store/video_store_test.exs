defmodule States.VideoStore.VideoStoreTest do
  use ExUnit.Case, async: true

  alias States.VideoStore
  alias States.VideoStore.Video

  describe "States.VideoStore.renting/1" do
    test "updates the rental count" do
      rented_video = VideoStore.renting(video())
      assert rented_video.times_rented == 1
    end
  end

  defp video, do: %Video{title: "XMen"}
end
