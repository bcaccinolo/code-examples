defmodule Sequence do

  use GenServer

  def start_link(state) do
    {:ok, pid} = GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def inc() do
    GenServer.call __MODULE__, :inc
  end

  def inc_with(delta) do
    GenServer.call __MODULE__, {:inc_with, delta}
  end

  def dec() do
    GenServer.call __MODULE__, :dec
  end

  # Genserver callbacks
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
