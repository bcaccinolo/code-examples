defmodule Juris.Repo do
  use Ecto.Repo, otp_app: :juris
  use Scrivener, page_size: 10

  # Set the pg_trgm for the fuzzy search
  def set_extension do
    IO.puts("⚡️ Activating the PG extension pg_trgm")
    __MODULE__.query "CREATE EXTENSION pg_trgm;"
  end
end
