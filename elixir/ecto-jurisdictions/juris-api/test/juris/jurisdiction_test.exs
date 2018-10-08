require IEx

defmodule Juris.JurisdictionTest do
  use ExUnit.Case

  test ".all" do
    assert is_list(Jurisdiction.all)
  end

  test ".all_paginated" do
    subject = Jurisdiction.all_paginated

    assert %Scrivener.Page{} = subject
    assert 1 = subject.page_number
  end

  # Fuzzy search
  test "Fuzzy search: query = fra" do
    assert ["France"] = Jurisdiction.fuzzy("fra")
  end

  test "Fuzzy search: query = gre" do
    assert ["Greece", "Grenada"] = Jurisdiction.fuzzy("gre")
  end

end
