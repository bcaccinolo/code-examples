defmodule Juris.Repo do
  use Ecto.Repo, otp_app: :juris

  # Set the pg_trgm for the fuzzy search
  def set_extension do
    query "CREATE EXTENSION pg_trgm;"
  end

end
