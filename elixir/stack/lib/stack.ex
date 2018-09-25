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

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end

end
