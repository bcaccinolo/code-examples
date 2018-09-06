defmodule Repo.Migrations.Jurisdictions do
  use Ecto.Migration

  def change do
    create table(:jurisdictions) do
      add :code, :string
    end
  end
end
