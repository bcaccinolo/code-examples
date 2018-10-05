defmodule Mix.Tasks.Db.SetExtension do
  use Mix.Task
  import Mix.Ecto

  @shortdoc "Set the extension pg_trgm"
  def run(_data) do
    ensure_started(Juris.Repo, [])
    Juris.Repo.SetExtension
  end
end
