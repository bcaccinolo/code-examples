defmodule Supervisor1.Worker do

  use Agent

  def start_link(_) do
    IO.puts "Worker running!"
    Agent.start_link(fn -> MapSet.new end)
  end
end
