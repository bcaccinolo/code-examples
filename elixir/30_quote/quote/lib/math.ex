defmodule Math do

  def coucou() do
    IO.puts("coucou")
  end

  defmacro squared(x) do
    quote do
      IO.puts("coucou")
    end
  end

end
