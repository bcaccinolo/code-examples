defmodule WithErlangTest do
  use ExUnit.Case
  doctest WithErlang

  test "greets the world" do
    assert WithErlang.hello() == :world
  end
end
