defmodule States.VideoStore.ConcreteTest do
  use ExUnit.Case, async: true

  alias States.Video
  alias States.VideoStore.Concrete

  describe "States.VideoStore.Concrete.rent/1" do
    setup do
      %{video: %Video{title: "XMen"}}
    end

    test "sets the state to :rented", %{video: video} do
      rented_video = Concrete.rent(video)
      assert rented_video.state == :rented
    end

    test "updates the rental count", %{video: video} do
      rented_video = Concrete.rent(video)
      assert rented_video.times_rented == 1
    end

    test "logs the transition", %{video: video} do
      rented_video = Concrete.rent(video)
      assert rented_video.log == ["Renting XMen"]
    end
  end

  describe "States.VideoStore.Concrete.return/1" do
    setup do
      %{video: %Video{state: :rented, title: "XMen"}}
    end

    test "sets the state to :available", %{video: video} do
      returned_video = Concrete.return(video)
      assert returned_video.state == :available
    end

    test "logs the transition", %{video: video} do
      returned_video = Concrete.return(video)
      assert returned_video.log == ["Returning XMen"]
    end
  end

  describe "States.VideoStore.Concrete.lose/1" do
    setup do
      %{video: %Video{state: :rented, title: "XMen"}}
    end

    test "sets the state to :lost", %{video: video} do
      lost_video = Concrete.lose(video)
      assert lost_video.state == :lost
    end

    test "logs the transition", %{video: video} do
      lost_video = Concrete.lose(video)
      assert lost_video.log == ["Losing XMen"]
    end
  end

  describe "States.VideoStore.Concrete" do
    test "handles multiple transitions" do
      video =
        %Video{title: "XMen"}
        |> Concrete.rent()
        |> Concrete.return()
        |> Concrete.rent()
        |> Concrete.return()
        |> Concrete.rent()

      assert Enum.count(video.log) == 5
      assert video.times_rented == 3
    end
  end
end
