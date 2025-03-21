defmodule States.Application do
  @moduledoc false
  use Application

  alias States.VideoStore.Server

  @impl true
  def start(_type, videos) do
    children = [{Server, videos}]
    opts = [strategy: :one_for_one, name: States.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
