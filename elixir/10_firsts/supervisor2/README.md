# Supervisor2

We supervise a Sequence process.
When it crashes, it is being restarted.
But the current state is lost...

## How to run it?
`iex -S mix` should do the job.

```
# to get the pid
:global.whereis_name :sequence

iex(3)> GenServer.call :global.whereis_name(:sequence), :inc
24
iex(4)> GenServer.call :global.whereis_name(:sequence), :inc
25
iex(5)> GenServer.call :global.whereis_name(:sequence), :dec
24
iex(6)> GenServer.call :global.whereis_name(:sequence), :dec
23

# crash the server
GenServer.call :global.whereis_name(:sequence), {:inc_with, 'cat'}

# and it still works
iex(7)> GenServer.call :global.whereis_name(:sequence), :inc
24

# But the state is re-initialize...
```