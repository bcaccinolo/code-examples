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

  # Not used yet
  def changeset(jurisdiction, params \\ %{}) do
    jurisdiction
    |> Ecto.Changeset.cast(params, [:code])
    |> Ecto.Changeset.validate_required([:code])
  end

end
