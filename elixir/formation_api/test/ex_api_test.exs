defmodule ExApiTest do
  use ExUnit.Case
  doctest ExApi

  test "greets the world" do
    assert ExApi.hello() == :world
  end
end
