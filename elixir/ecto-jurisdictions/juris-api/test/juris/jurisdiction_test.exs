require IEx

defmodule Juris.JurisdictionTest do
  use ExUnit.Case

  # Fuzzy search
  test "Fuzzy search: query = fra" do
    assert ["France"] = Jurisdiction.fuzzy("fra")
  end

  test "Fuzzy search: query = gre" do
    assert ["Greece", "Grenada"] = Jurisdiction.fuzzy("gre")
  end

end
