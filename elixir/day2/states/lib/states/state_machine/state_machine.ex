defmodule States.StateMachine do
  @moduledoc false
  defmacro __using__(_) do
    quote do
      import States.StateMachine

      @states []
      @before_compile States.StateMachine
    end
  end

  defmacro state(name, events) do
    quote do
      @states [{unquote(name), unquote(events)} | @states]
    end
  end

  # coveralls-ignore-start
  defmacro __before_compile__(env) do
    states = Module.get_attribute(env.module, :states)

    events =
      states
      |> Keyword.values()
      |> List.flatten()
      |> Keyword.keys()
      |> Enum.uniq()

    quote do
      defp state_machine do
        unquote(states)
      end

      unquote(event_callbacks(events))
    end
  end

  def event_callback(name) do
    callback = name
    before_callback = :"before_#{name}"
    after_callback = :"after_#{name}"

    quote do
      def unquote(name)(context) do
        if function_exported?(__MODULE__, unquote(before_callback), 0) do
          apply(__MODULE__, unquote(before_callback), [])
        end

        result = States.StateMachine.Behaviour.fire(state_machine(), context, unquote(callback))

        if function_exported?(__MODULE__, unquote(after_callback), 0) do
          apply(__MODULE__, unquote(after_callback), [])
        end

        result
      end
    end
  end

  def event_callbacks(names) do
    Enum.map(names, &event_callback/1)
  end

  # coveralls-ignore-stop
end
