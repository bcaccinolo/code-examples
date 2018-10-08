defmodule Juris.MixProject do
  use Mix.Project

  def project do
    [
      app: :juris,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug],
      mod: {Juris.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 2.2.10"},
      {:scrivener_ecto, "~> 1.3.0"},
      {:postgrex, "~> 0.13.5"},
      {:csv, "~> 2.1.1"},
      {:cowboy, "~> 2.4.0"},
      {:plug, "~> 1.6.3"},
      {:jason, "~> 1.1.1"}
    ]
  end
end
