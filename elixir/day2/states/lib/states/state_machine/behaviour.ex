defmodule States.StateMachine.Behaviour do
  @moduledoc false
  def fire(context, event) do
    activate(%{context | state: event[:to]}, event)
  end

  def fire(states, context, event_name) do
    event = states[context.state][event_name]
    fire(context, event)
  end

  def activate(context, event) do
    Enum.reduce(event[:calls] || [], context, & &1.(&2))
  end
end
