defmodule Scheduler do
  @moduledoc """
  The Process Scheduler to count the 'cat' words.
  """

  @doc """
  The main method

  num_process is the amount of processes to spawn.
  """
  def init num_process, directory do
    (1..num_process)
    |>  Enum.map(fn(_) ->
          spawn_link(CatCounter, :count, [self(), directory])
        end)
    |>  loop(File.ls!(directory))
  end

  @doc """
  The loop sending request to processes.
  """
  def loop processes, to_process do
    receive do
      {:ready, pid} when to_process != [] ->
        "Calculator #{inspect pid} is ready to serve!" |> cputs
        [ path | tail ] = to_process
        send pid, {:count, path}
        loop(processes, tail)

      {:ready, _pid} ->
        loop(processes, to_process)

      {:result, file, value} ->
        "cat counter in #{file} is #{value}" |> cputs
        loop(processes, to_process)
    after
      1000 -> "stopping here !" |> cputs
    end
  end

  # IO.puts with colors !
  defp cputs txt do
    [:red, txt] |> Bunt.puts
  end

end
