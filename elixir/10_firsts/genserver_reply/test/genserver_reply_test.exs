defmodule GenserverReplyTest do
  use ExUnit.Case
  doctest GenserverReply

  test "greets the world" do
    assert GenserverReply.hello() == :world
  end
end
