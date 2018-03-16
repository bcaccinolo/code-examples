
# Named processes
pid = Process.whereis(MyRegistry)

Process.alive?(pid)

###############################################################################
# initializatioin of the Registry
# MyRegistry |> Registry.

Registry.start_link(keys: :unique, name: MyRegistry)

MyRegistry |> Registry.register("hello", [])

# all the keys registered with this PID
MyRegistry |> Registry.keys(self())

MyRegistry |> Registry.lookup("hello")

MyRegistry |> Registry.register({:via, MyProcess, {'hello', []}})

# register a genserver with a name in the registry: MyRegistry
name = {:via, Registry, {MyRegistry, "genserver_name"}}
{:ok, pid} = GenServer.start_link(Stack, [:hello], name: name)

###############################################################################
# Simple GenServer for testing
defmodule Stack do
  use GenServer

  # Callbacks
  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end

# Start the server
{:ok, pid} = GenServer.start_link(Stack, [:hello])

# This is the client
GenServer.call(pid, :pop)
#=> :hello

GenServer.cast(pid, {:push, :world})
#=> :ok

GenServer.call(pid, :pop)
#=> :world



