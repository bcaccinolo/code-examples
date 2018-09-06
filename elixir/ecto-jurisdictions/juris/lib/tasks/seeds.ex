defmodule Mix.Tasks.Seeds.Load do
  use Mix.Task
  import Mix.Ecto

  @shortdoc "simple task to run seeds"
  def run(_data) do
    ensure_started(Repo, [])
   Seed.load
  end
end
