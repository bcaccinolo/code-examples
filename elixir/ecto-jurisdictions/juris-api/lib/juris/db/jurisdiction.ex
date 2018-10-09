defmodule Jurisdiction do
  use Ecto.Schema
  # Imports only from/2 of Ecto.Query
  import Ecto.Query, only: [from: 2]

  schema "jurisdictions" do
    field(:code, :string)
    field(:name, :string)
  end

  # Query all the Jurisdicnions with pagination
  def all_paginated(page) do
    from( j in Jurisdiction,
          select: [j.name, j.code] )
    |> Juris.Repo.paginate(page: page)
  end

  # Query all the Jurisdicnions
  def all do
    from( j in Jurisdiction,
          select: [j.name, j.code] )
    |> Juris.Repo.all
  end

  # Fuzzy search
  def fuzzy(query) do
    "select name, code from jurisdictions where name % '#{query}';"
    |> Juris.Repo.query
    |> case do
      {:ok, %Postgrex.Result{rows: rows}} -> rows
      {:error, _} -> :error
    end
  end

end
