defmodule States.VideoStore.DETSTest do
  use ExUnit.Case, async: true

  alias States.Video
  alias States.VideoStore.DETS

  describe "States.VideoStore.DETS" do
    setup do
      DETS.start_link(nil)
      DETS.add(:xmen, %Video{title: "X men"})
    end

    test("Allows videos to be rented") do
      assert %States.Video{title: "X men", state: :rented, times_rented: 1} = DETS.rent(:xmen)
    end

    test("Allows videos to be returned") do
      DETS.rent(:xmen)
      assert %States.Video{title: "X men", state: :available} = DETS.return(:xmen)
    end

    test("Allows rented videos to be lost") do
      DETS.rent(:xmen)
      assert %States.Video{title: "X men", state: :lost} = DETS.lose(:xmen)
    end

    test("Allows lost videos to be found") do
      DETS.rent(:xmen)
      DETS.lose(:xmen)
      assert %States.Video{title: "X men", state: :found} = DETS.find(:xmen)
    end
  end
end
