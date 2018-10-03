defmodule Juris.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Juris.Repo,
      Plug.Adapters.Cowboy2.child_spec( scheme: :http,
                                        plug: Juris.Router,
                                        options: [port: Application.get_env(:juris, :port)])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Juris.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
