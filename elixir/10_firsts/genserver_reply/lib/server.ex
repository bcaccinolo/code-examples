defmodule Server do

  use GenServer

  def start_link(state \\ {}) do
    IO.puts("Launching the Server!")
    {:ok, pid} = GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def inc do
    GenServer.call(__MODULE__, :inc)
  end

  # Genserver callbacks
  def init(state) do
    {:ok, state}
  end

  def handle_call(:inc, _from, state) do
    IO.puts("in the handle call :inc")
    {:noreply, state}
  end

end
