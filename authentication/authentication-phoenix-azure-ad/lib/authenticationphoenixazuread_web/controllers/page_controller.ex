defmodule AuthenticationphoenixazureadWeb.PageController do
  use AuthenticationphoenixazureadWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
