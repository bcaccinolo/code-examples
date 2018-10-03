defmodule Juris.Router do

  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)

  # Simple GET Request handler for path /hello
  get "/hello" do
    send_resp(conn, 200, "world")
  end

  match _ do
    send_resp(conn, 400, "not found")
  end

end
