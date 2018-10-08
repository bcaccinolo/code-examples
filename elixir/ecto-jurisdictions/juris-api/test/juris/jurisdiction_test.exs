require IEx

defmodule Juris.JurisdictionTest do
  use ExUnit.Case

  test ".all" do
    assert is_list(Jurisdiction.all)
  end

  test ".all_paginated with page 1" do
    subject = Jurisdiction.all_paginated(1)

    assert %Scrivener.Page{} = subject
    assert subject.page_number == 1
  end

  test ".all_paginated with page 1 and 2" do
    %Scrivener.Page{page_number: page1} = Jurisdiction.all_paginated(1)
    %Scrivener.Page{page_number: page2} = Jurisdiction.all_paginated(2)

    refute page1 == page2
  end

  test "Fuzzy search: query = fra" do
    assert ["France"] == Jurisdiction.fuzzy("fra")
  end

  test "Fuzzy search: query = gre" do
    assert ["Greece", "Grenada"] == Jurisdiction.fuzzy("gre")
  end

end
