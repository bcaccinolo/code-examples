defmodule QuoteTest do
  use ExUnit.Case
  doctest Quote

  require Math

  test "the created macro" do
    Math.squared(1)
  end

  test "greets the world" do
    assert Quote.hello() == :world
  end
end
