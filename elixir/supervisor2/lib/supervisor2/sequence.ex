defmodule Supervisor2.Sequence do

  @name :sequence

  use GenServer

  def start_link(state) do
    {:ok, pid} = GenServer.start_link(__MODULE__, state)
    :global.register_name(@name, pid)
    {:ok, pid}
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(:inc, _from, state) do
    {:reply, state + 1, state + 1}
  end

  def handle_call(:dec, _from, state) do
    {:reply, state - 1, state - 1}
  end

  def handle_call({:inc_with, delta}, _from, state) do
    {:reply, state + delta, state + delta}
  end

end
