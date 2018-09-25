defmodule Pmap.Base do
  def init n do
    # Launch n server with a function to exectue and return result to me
    1..n
    |> Enum.map(&spawn(Pmap.Function, :send_square, [self(), &1]))
    |> Enum.map(fn pid ->
      receive do
        {:ok, ^pid, msg} -> msg
      end
    end)
    |> IO.inspect()
  end
end
