defmodule LittleServerTest do
  use ExUnit.Case
  doctest LittleServer

  test "greets the world" do
    assert LittleServer.hello() == :world
  end
end
