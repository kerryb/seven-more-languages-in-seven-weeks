defmodule States.VideoStore.AgentTest do
  use ExUnit.Case, async: true

  alias States.Video
  alias States.VideoStore.Agent

  describe "States.VideoStore.Agent" do
    setup do
      Agent.start_link(nil)
      Agent.add(:xmen, %Video{title: "X men"})
    end

    test("Allows videos to be rented") do
      assert %States.Video{title: "X men", state: :rented, times_rented: 1} = Agent.rent(:xmen)
    end

    test("Allows videos to be returned") do
      Agent.rent(:xmen)
      assert %States.Video{title: "X men", state: :available} = Agent.return(:xmen)
    end

    test("Allows rented videos to be lost") do
      Agent.rent(:xmen)
      assert %States.Video{title: "X men", state: :lost} = Agent.lose(:xmen)
    end

    test("Allows lost videos to be found") do
      Agent.rent(:xmen)
      Agent.lose(:xmen)
      assert %States.Video{title: "X men", state: :found} = Agent.find(:xmen)
    end
  end
end
