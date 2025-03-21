defmodule States.VideoStoreTest do
  use ExUnit.Case, async: true

  alias States.Video
  alias States.VideoStore

  describe "States.VideoStore" do
    setup do
      VideoStore.add({:xmen, %Video{title: "X men"}})
    end

    test("Allows videos to be rented") do
      assert %States.Video{title: "X men", state: :rented, times_rented: 1} = VideoStore.rent(:xmen)
    end

    test("Allows videos to be returned") do
      VideoStore.rent(:xmen)
      assert %States.Video{title: "X men", state: :available} = VideoStore.return(:xmen)
    end

    test("Allows rented videos to be lost") do
      VideoStore.rent(:xmen)
      assert %States.Video{title: "X men", state: :lost} = VideoStore.lose(:xmen)
    end

    test("Allows lost videos to be found") do
      VideoStore.rent(:xmen)
      VideoStore.lose(:xmen)
      assert %States.Video{title: "X men", state: :found} = VideoStore.find(:xmen)
    end
  end
end
