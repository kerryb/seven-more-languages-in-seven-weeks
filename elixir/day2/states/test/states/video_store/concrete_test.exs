defmodule States.VideoStore.ConcreteTest do
  use ExUnit.Case, async: true

  alias States.Video
  alias States.VideoStore.Concrete

  describe "States.VideoStore.Concrete.rent/1" do
    test "sets the state to :rented" do
      rented_video = Concrete.rent(video())
      assert rented_video.state == :rented
    end

    test "logs the transition" do
      rented_video = Concrete.rent(video())
      assert Enum.count(rented_video.log) == 1
    end
  end

  describe "States.VideoStore.Concrete" do
    test "handles multiple transitions" do
      vid =
        video()
        |> Concrete.rent()
        |> Concrete.return()
        |> Concrete.rent()
        |> Concrete.return()
        |> Concrete.rent()

      assert Enum.count(vid.log) == 5
      assert vid.times_rented == 3
    end
  end

  defp video, do: %Video{title: "XMen"}
end
