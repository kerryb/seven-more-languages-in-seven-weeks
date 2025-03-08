defmodule States.StateMachineTest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  describe "States.StateMachine" do
    defmodule SimpleStateMachine do
      @moduledoc false
      use States.StateMachine

      state(:off, on: [to: :on, calls: [&__MODULE__.turn_on/1]], lock: [to: :locked])
      state(:on, off: [to: :off, calls: [&__MODULE__.turn_off/1]])

      def before_on, do: IO.puts("Warming up")
      def turn_on(_), do: IO.puts("Turning on")
      def turn_off(_), do: IO.puts("Turning off")
      def after_off, do: IO.puts("Cooling down")
    end

    test "calls before_<event> if implemented" do
      assert capture_io(fn -> SimpleStateMachine.on(%{state: :off}) end) =~ "Warming up\nTurning on"
    end

    test "calls after_<event> if implemented" do
      assert capture_io(fn -> SimpleStateMachine.off(%{state: :on}) end) =~ "Turning off\nCooling down"
    end

    test "allows before_<event> and after_<event> to be missing" do
      SimpleStateMachine.lock(%{state: :off})
    end
  end
end
