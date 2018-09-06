defmodule Seed do

  # c "./lib/juris/seed.ex"

  @doc """
  Loads all Jurisdctions from the CSV file.

  Main method.
  """
  def load do
    "../priv/seeds/all.csv"
    |> Path.expand(__DIR__)
    |> File.stream!
    |> CSV.decode
    |> Enum.each(fn(e) -> store_jurisdiction(e) end)
  end

  @doc """
  Store one jurisdiction
  """
  def store_jurisdiction({:ok, [name, code | _]}) do
    %Jurisdiction{ code: code, name: name}
    |> Repo.insert!
    |> IO.inspect(label: "after")
  end

end
