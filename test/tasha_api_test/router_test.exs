defmodule TashaApiTest.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts TashaApi.Router.init([])

  test "return alive" do
    build_conn = conn(:get, "/")
    conn = TashaApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Alive!"
  end

  test "return song name" do
    build_conn = conn(:get, "/songName?songName=Hello")
    conn = TashaApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "The song name is Hello"
  end

  test "return 404 not found" do
    build_conn = conn(:get, "/jlzlzzklzzll")
    conn = TashaApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "Not Found"
  end
end
