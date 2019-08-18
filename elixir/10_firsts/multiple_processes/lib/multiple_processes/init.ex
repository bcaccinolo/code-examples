defmodule MultipleProcesses.Init do

  def multiple(n) do
    last = Enum.reduce(1..n, self(), fn _, pid ->
                                new_pid = spawn(MultipleProcesses.Node, :call, [pid])
                                new_pid
                              end)

    # Igniting the process communication
    send(last, "couscous!")

    receive do
      msg ->
        IO.puts("[#{inspect self()}] Last of the line: #{msg} ")
    end

  end
end
