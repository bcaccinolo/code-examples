defmodule Gstage do
  @moduledoc """
  Documentation for Gstage.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gstage.hello()
      :world

  """
  def start do
    IO.puts("Start servers A, B and C...")

    {:ok, a} = A.start_link(0)  # starting from zero
    {:ok, b} = B.start_link(2)  # multiply by 2
    {:ok, c} = C.start_link([]) # state does not matter

    IO.puts("Subscriptions...")
    GenStage.sync_subscribe(c, to: b)
    GenStage.sync_subscribe(b, to: a)
  end
end
