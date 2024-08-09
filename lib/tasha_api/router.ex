defmodule TashaApi.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: JSON
  )

  plug(:dispatch)

  get("/", do: send_resp(conn, 200, "Alive!"))

  get "/songName" do
    song_name = conn.query_params["songName"]
    send_resp(conn, 200, "The song name is #{song_name}")
  end

  match(_, do: send_resp(conn, 404, "Not Found"))
end
