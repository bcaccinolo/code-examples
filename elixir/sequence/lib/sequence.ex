defmodule Sequence do

  use GenServer

  def init(state) do
    {:ok, state}
  end

  def handle_call(:inc, _from, state) do
    {:reply, state + 1, state + 1}
  end

  def handle_call(:dec, _from, state) do
    {:reply, state - 1, state - 1}
  end

end
