defmodule ExApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: ExApi.Worker.start_link(arg)
      # {ExApi.Worker, arg},
      ExApi.Repo,
      Plug.Adapters.Cowboy.child_spec(:http, ExApi.PlugRouter, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
