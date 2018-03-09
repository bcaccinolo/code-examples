defmodule ExApi.Repo do
  use Ecto.Repo, otp_app: :ex_api
end

# Category Model
defmodule ExApi.Category do
  use Ecto.Schema

  # definition of the JSON encoder: here Jason
  @derive {Jason.Encoder, only: [:id, :name]}
  schema "categories" do
    field(:name)
    timestamps()
  end

  # Queries & Scopes are stored in a nested module
  defmodule Queries do
    import Ecto.Query

    def getBenoit do
      query = from c in ExApi.Category,
              where: c.name == "benoit",
              select: c

      # this should not be there. With this we can not pipe this query with another one.
      ExApi.Repo.all(query)
    end

    # this query does not have a ExApi.Repo call so it can be `piped` with others.
    def getByName(name) do
      from c in ExApi.Category, where: c.name == ^name
    end


  end
end
