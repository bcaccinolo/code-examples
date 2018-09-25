defmodule MultipleProcessesTest do
  use ExUnit.Case
  doctest MultipleProcesses

  test "greets the world" do
    assert MultipleProcesses.hello() == :world
  end

  test "launcher" do
    {time, _} = :timer.tc(fn -> MultipleProcesses.Init.multiple(200000) end)
    IO.puts "#{time / 1000} millisecond"
    assert true
  end

end
