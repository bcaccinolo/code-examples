defmodule Stack do
  @moduledoc """
  The Genserver implementing the stack
  """

  use GenServer

  def init(state) do
    {:ok, state}
  end

  def handle_call(:pop, _from, [h | tl]) do
    {:reply, h, tl}
  end

end


# {:ok, pid} = GenServer.start_link Stack, [1, 3]

# GenServer.call pid, :pop
