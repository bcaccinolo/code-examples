defmodule Ticker do

  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    IO.puts("the pid is #{inspect pid}")
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients) do
    receive do
      { :register, pid } ->
        IO.puts "Registering #{inspect pid}"
        generator([pid | clients])
      after
        @interval ->
          IO.puts("tick")
          spawn(fn ->
            IO.puts("Client list is #{inspect clients}")
            Enum.each clients, fn client ->
              send client, { :tick }
            end
          end)
    end
    generator(clients)
  end

end
