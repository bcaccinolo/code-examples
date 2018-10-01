defmodule Mix.Tasks.Seeds.Load do
  use Mix.Task
  import Mix.Ecto

  @shortdoc "Load seeds"
  def run(_data) do
    ensure_started(Juris.Repo, [])
    Seed.load
  end
end
