defmodule CatCounterTest do
  use ExUnit.Case
  doctest CatCounter

  test "greets the world" do
    Scheduler.init(3)
  end
end
