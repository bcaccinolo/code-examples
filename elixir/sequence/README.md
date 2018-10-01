# Sequence

Simple Sequence GenServer that inc or dec a state value.

Interesting thing here is that the GenServer is always accessed through its name
and not just a pid.

## How to run it ?

In iex :
```
iex(2)> Sequence.start_link 21
{:ok, #PID<0.139.0>}

iex(2)> Sequence.inc
22

iex(3)> Sequence.dec
21

iex(5)> Sequence.inc_with 5
29

iex(5)> Sequence.inc_with "cat"
11:08:36.556 [error] GenServer Sequence terminating
...
```
