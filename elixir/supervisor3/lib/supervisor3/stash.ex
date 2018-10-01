defmodule Supervisor3.Stash do

  use Agent

  def start_link(state) do
    IO.puts("Launching the Stash!")
    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def get do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def set new_state do
    Agent.update(__MODULE__, fn _ -> new_state end)
  end

end
