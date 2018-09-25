defmodule Supervisor1.Application do

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Supervisor1.Worker.start_link(arg)
      %{
          id: :id1,
          start: {Supervisor1.Worker, :start_link, [[]]}
        },
        %{
          id: :id2,
          start: {Supervisor1.Worker, :start_link, [[]]}
        }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Supervisor1.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
