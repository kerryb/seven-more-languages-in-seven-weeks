defmodule States.VideoStoreTest do
  use ExUnit.Case, async: true

  alias States.Video
  alias States.VideoStore

  describe "States.VideoStore" do
    setup do
      VideoStore.add(:xmen, %Video{title: "X men"})
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

    test "Retains data when the server crashes" do
      VideoStore.rent(:xmen)
      VideoStore.return(:xmen)

      GenServer.stop(:video_store)
      wait_for_server()

      assert %States.Video{title: "X men", state: :rented, times_rented: 2} = VideoStore.rent(:xmen)
    end
  end

  defp wait_for_server do
    if is_nil(GenServer.whereis(:video_store)) do
      wait_for_server()
    end
  end
end
