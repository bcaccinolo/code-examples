# Stack

Simple Stack implemented with a GenServer.

## Command to run to launch the server:

```
{:ok, pid} = GenServer.start_link Stack, [1, 3]

# Get a value from the stack
GenServer.call pid, :pop

# Put a value on the stack
GenServer.cast pid, {:push, 12}
```
