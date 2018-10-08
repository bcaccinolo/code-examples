defmodule Juris.UseCases.GetFuzzySearch do

  def call(query) do
    Jurisdiction.fuzzy(query) |> Jason.encode!
  end

end
