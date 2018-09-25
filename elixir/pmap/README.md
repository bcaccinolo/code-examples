# Pmap

This a part of the book Elixir, Functional programming.

Pmap stands for `Parallel map`.

It launches a process for each calculation and it waits for the return in the same order.

## How to launch?
In iex, launch :
```
Pmap.Base.init(10)
```
