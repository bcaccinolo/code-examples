defmodule MultipleProcesses.Node do

  def call(dest) do
    IO.puts("Process #{inspect self()} waiting for a message")
    receive do
      msg ->
        IO.puts("Receiving message #{msg} and sending it to #{inspect dest}")
        send(dest, msg)
    end
  end

end
