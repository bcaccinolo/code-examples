defmodule Jurisdiction do
  use Ecto.Schema

  # weather is the DB table
  schema "jurisdictions" do
    field(:code, :string)
    field(:name, :string)
  end

def changeset(jurisdiction, params \\ %{}) do
  jurisdiction
  |> Ecto.Changeset.cast(params, [:code])
  |> Ecto.Changeset.validate_required([:code])
end

end
