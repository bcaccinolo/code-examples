defmodule Seed do

  @doc """
  Loads all Jurisdctions from the CSV file.
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
  def store_jurisdiction({:ok, data}) do
    code = data |> List.pop_at(1) |> elem(0)

    %Jurisdiction{ code: code}
    |> Repo.insert!
    |> IO.inspect(label: "after")
  end

end
