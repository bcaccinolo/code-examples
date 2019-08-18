defmodule AliasAlias do
  @moduledoc """
  Documentation for AliasAlias.
  """

  alias AliasAlias.Foo
  # identical to: alias AliasAlias.Foo, as: Foo

  def call do
    Foo.bar
  end
end
