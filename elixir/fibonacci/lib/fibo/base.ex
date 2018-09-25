defmodule Fibonacci.Process do
  @moduledoc """
  Simple technique spawning one process per calculation
  """

  def fib(dest, 0) do send(dest, 0) end
  def fib(dest, 1) do send(dest, 1) end
  def fib(dest, n) do
    result =  1..2
              |> Enum.map(fn x ->
                            spawn(Fibonacci.Process, :fib, [self(), n - x])
                          end)
              |> Enum.map(fn _pid ->
                            receive do
                              msg -> msg
                            end
                          end)
              |> Enum.reduce(fn v, acc -> acc + v end)
    send dest, result
  end
end

{time, _} = :timer.tc fn -> Fibonacci.Process.fib(self(), 25) end
IO.puts("time is #{time / 1000} ms")
