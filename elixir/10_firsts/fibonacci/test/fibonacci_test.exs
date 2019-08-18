defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "greets the world" do
    assert Fibonacci.hello() == :world
  end

  test "fib(0)" do
    assert Fibonacci.Process.fib(self(), 0) == 0
  end

  test "fib(1)" do
    assert Fibonacci.Process.fib(self(), 1) == 1
  end

  test "fib(2)" do
    assert Fibonacci.Process.fib(self(), 2) == 1
  end

  test "fib(3)" do
    assert Fibonacci.Process.fib(self(), 3) == 2
  end

  test "fib(10)" do
    assert Fibonacci.Process.fib(self(), 10) == 55
  end

  test "preformance" do
    {time, _} = :timer.tc fn -> Fibonacci.Process.fib(self(), 30) end
    IO.puts("time is #{time / 1000} ms")
  end

end
