defmodule CatCounter do
  @moduledoc """
  Process that count cats in a file.
  """

  def count dest, directory do
    send dest, {:ready, self()}

    receive do
      {:count, file} ->
        'Starting counting cats in file #{Path.join(directory, file)}' |> cputs
        content = Path.join(directory, file)
                  |> File.read!

        counter = Regex.scan(~r/puts/, content)
                  |> length

        send dest, {:result, file, counter}

        count(dest, directory)
    end
  end

  # IO.puts with colors !
  defp cputs txt do
    [:green, txt] |> Bunt.puts
  end
end
