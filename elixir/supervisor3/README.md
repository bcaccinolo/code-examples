# Supervisor3

Supervise a Sequence and keep the state accross crashes.

# How to launch

In `iex`:

```
Supervisor3.Sequence.inc
1

Supervisor3.Sequence.inc
2

Supervisor3.Sequence.inc_with 2
4

Supervisor3.Sequence.inc_with "the cat"
Storing the state before crarhing

Supervisor3.Sequence.inc
5

Supervisor3.Sequence.inc
6
```
