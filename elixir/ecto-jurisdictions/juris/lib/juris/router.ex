defmodule Juris.Router do

  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)

  # Return all jurisdictions in Json format
  get "/jurisdictions" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Juris.UseCases.GetJurisdictions.call)
  end

  # Return Fuzzy found jurisdictions in Json format
  get "/fuzzy/:query" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Juris.UseCases.GetFuzzySearch.call(query))
  end

  match _ do
    send_resp(conn, 400, "not found")
  end

end
