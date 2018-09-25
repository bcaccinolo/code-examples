defmodule PmapTest do
  use ExUnit.Case
  doctest Pmap

  test "greets the world" do
    n = 200000
    IO.puts("Launching #{n} processes")
    {time, _} = :timer.tc(fn -> Pmap.Base.init(n) end)
    IO.puts "time: #{time / 1000} ms"
  end
end
