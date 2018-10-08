defmodule Juris.UseCases.GetJurisdictions do

  def call do
    Jurisdiction.all |> Jason.encode!
  end

end
