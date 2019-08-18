# ExApi

## Launch the service with `mix`

```
mix run
```

## To launch a web server from IEX:

We have the launch command and the one to kill the already running one.
```
Process.exit pid, :kill

{:ok, pid} = Plug.Adapters.Cowboy.http ExApi.PlugRouter, []
```

## Ecto configuration

This is done in several steps:

 - First, configuration of Ecto in the config.exs.
 - Definition of the Repo module in /lib.
   A repository is basically a storage endpoint (a Pg DB for example or a Redis).
   Here the module is ExApi.Repo
 - Launch of our ExApi.Repo in the application children in application.ex.
 - Ecto and the DB adapter have to be launched at startup:
```
    [
      extra_applications: [:logger, :cowboy, :plug, :ecto, :postgrex],
      mod: {ExApi.Application, []}
    ]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_api, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_api](https://hexdocs.pm/ex_api).

