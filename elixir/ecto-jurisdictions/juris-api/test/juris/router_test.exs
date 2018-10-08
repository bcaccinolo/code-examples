require IEx
defmodule RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Juris.Router

  @opts Router.init([])

  # GET /jurisdictions/page
  test "/jurisdictions/1" do
    # Create a test connection
    conn = conn(:get, "/jurisdictions/1")

    # Invoke the plug
    conn = Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body |> Jason.decode! |> is_map
  end

  test "Fuzzy search ' fra' (starts with a space)" do
    # Create a test connection
    conn = conn(:get, "/fuzzy/%20fra")

    # Invoke the plug
    conn = Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "[\"France\"]"
  end
end
