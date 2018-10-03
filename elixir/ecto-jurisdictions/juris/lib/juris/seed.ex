defmodule Seed do

  @doc """
  Loads all Jurisdctions from the CSV file.

  Main method.
  """
  def load do
    "../../priv/seeds/all.csv"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> IO.inspect
    |> CSV.decode
    |> Enum.each(fn(e) -> store_jurisdiction(e) end)
  end

  @doc """
  Store one jurisdiction
  """
  def store_jurisdiction({:ok, [name, code | _]}) do
    %Jurisdiction{ code: code, name: name}
    |> Juris.Repo.insert!
    |> IO.inspect(label: "after")
  end

end
