defmodule RedisEtsTest do
  use ExUnit.Case
  doctest RedisEts

  test "greets the world" do
    assert RedisEts.hello() == :world
  end
end
