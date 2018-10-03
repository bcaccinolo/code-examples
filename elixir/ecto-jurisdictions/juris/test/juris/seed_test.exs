defmodule Juris.SeedTest do
  use ExUnit.Case

  # Loading the seeds
  test "the first entry is a jurisdiction and not a random header." do
    [name, code] = hd(Jurisdiction.all())
    refute "name" == name
    refute "alpha-2" ==  code
  end
end
