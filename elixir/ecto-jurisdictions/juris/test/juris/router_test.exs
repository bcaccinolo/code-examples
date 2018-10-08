defmodule RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Juris.Router

  @opts Router.init([])

  test "Fuzzy search 'fra'" do
    # Create a test connection
    conn = conn(:get, "/fuzzy/fra")

    # Invoke the plug
    conn = Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "[\"France\"]"
  end
end
