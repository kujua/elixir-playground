defmodule AuthenticationapiuberauthWeb.PageController do
  use AuthenticationapiuberauthWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
