defmodule LearningPlug do

  use Plug.Router
  plug :match
  plug :dispatch
  plug Plug.Logger

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  get "/" do
    send_resp(conn, 200, "root")
  end

  match _ do
    send_resp(conn, 404, "OOPS!")
  end

end
