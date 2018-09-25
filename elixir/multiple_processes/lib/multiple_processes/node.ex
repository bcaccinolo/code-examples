defmodule MultipleProcesses.Node do

  def call(dest) do
    receive do
      msg -> send(dest, msg)
    end
  end

end
