defmodule States.VideoStore.Video do
  @moduledoc false
  defstruct title: "", state: :available, times_rented: 0, log: []
end
