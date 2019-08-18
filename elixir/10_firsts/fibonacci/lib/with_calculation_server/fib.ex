defmodule Calculator do
  @moduledoc """
  One process calculator
  """

  def start scheduler do
    send scheduler, {:ready, self()}
    receive do
      {:fib, value} ->  send scheduler, {:result, value, fib(value)}
                        start scheduler
    end
  end

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n-1) + fib(n-2) end
end

defmodule Scheduler do
  @moduledoc """
  Main module spawning Calculators
  """

  def start num_process do
    (1..num_process)
    |> Enum.map(fn(_) -> spawn(Calculator, :start, [self()]) end)

    # loop([], [1,2,3,4,5,6])
    loop([], [25])
  end

  def loop processes, to_process do
    # IO.inspect processes
    receive do
      {:ready, pid} ->  IO.puts "Calculator #{inspect pid} is ready to server!"
                        if length(to_process) > 0 do
                          [next | tail] = to_process
                          send pid, {:fib, next}
                          loop(processes, tail)
                        else
                          loop([pid | processes], to_process)
                        end

      {:result, value, result} -> IO.puts "fib(#{value}) = #{result}"
                                  loop(processes, to_process)
    after
      1000 -> IO.puts "stopping here !"
    end
  end
end

{time, _} = :timer.tc fn -> Scheduler.start(2) end
IO.puts("time is #{time / 1000} ms")
