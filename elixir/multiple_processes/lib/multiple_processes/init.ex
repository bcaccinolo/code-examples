defmodule MultipleProcesses.Init do

  def call do
    IO.puts "calling!"
  end

  def multiple(n) do

    last = Enum.reduce(1..n, self(), fn _, pid ->
                                new_pid = spawn(MultipleProcesses.Node, :call, [pid])
                                new_pid
                              end)

    # Igniting the process communication
    send(last, "coucou")
  end
end
