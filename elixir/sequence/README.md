# Sequence

Simple Sequence GenServer that inc or dec a state value.

## How to run it ?

In iex :
```
{:ok, pid} = GenServer.start_link(Sequence, 2)

iex(3)> GenServer.call pid, :inc
3
iex(4)> GenServer.call pid, :inc
4
iex(4)> GenServer.call pid, :dec
3
iex(5)> GenServer.call pid, :dec
2
```
