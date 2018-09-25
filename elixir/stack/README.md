# Stack

## Command to run to launch the server:

```
{:ok, pid} = GenServer.start_link Stack, [1, 3]

GenServer.call pid, :pop
```
