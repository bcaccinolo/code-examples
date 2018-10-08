defmodule Juris.UseCases.GetJurisdictions do

  def call(page) do
    page
    |> Jurisdiction.all_paginated
    |> Map.from_struct
    |> Jason.encode!
  end

end
