defmodule Jurisdiction do
  use Ecto.Schema
  # Imports only from/2 of Ecto.Query
  import Ecto.Query, only: [from: 2]

  # weather is the DB table
  schema "jurisdictions" do
    field(:code, :string)
    field(:name, :string)
  end

  # Query all the Jurisdicnions
  def all do
    query = from( j in Jurisdiction,
                  select: [j.name, j.code] )
    Juris.Repo.all(query)
  end

  # Fuzzy search
  def fuzzy(query) do
    query = "select name from jurisdictions where name % '#{query}';"
    case Juris.Repo.query(query) do
      {:ok, %Postgrex.Result{rows: rows}} -> List.flatten(rows)
      {:error, _} -> :error
    end
  end

end
