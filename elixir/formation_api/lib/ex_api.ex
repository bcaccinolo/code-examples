require IEx

defmodule ExApi do

  # Basic solution without any help from external Plugs
  #
  # Plug.Adapters.Cowboy.http ExApi.Simple, []
  defmodule Simple do
    import Plug.Conn

    def init(opts) do
      opts
    end

    def call(conn, _opt) do
      conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "hello world")
    end
  end

  # We are building a simple `router` using pattern matching.
  #
  # pid = Plug.Adapters.Cowboy.http ExApi.Router, []
  defmodule Router do
    import Plug.Conn

    def init(opts) do
      opts
    end

    def call(conn, _opt) do
      route(conn.method, conn.path_info, conn)
    end

    def route("GET", ["hello"], conn) do
      conn |> send_resp(200, "world")
    end

    def route("GET", ["/"], conn) do
      conn |> send_resp(200, "root")
    end

    def route("GET", ["user", user_id], conn) do
      conn |> send_resp(200, user_id)
    end

    def route(method, path, conn) do
      IO.puts("default")
      IO.puts(method)
      IO.puts(path)
      conn |> send_resp(400, "root")
    end
  end

  # We are using `Plug.Router` like Pros
  #
  # pid = Plug.Adapters.Cowboy.http ExApi.PlugRouter, []
  defmodule PlugRouter do
    use Plug.Router

    plug(:match)
    plug(:dispatch)

    get "/hello/:name" do
      cat = ExApi.Category.Queries.getByName(name) |> ExApi.Repo.all() |> List.first()
      # IEx.pry
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode(cat))
    end

    match _ do
      send_resp(conn, 400, "not found")
    end

  end
end
