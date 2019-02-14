defmodule AuthenticationphoenixuberauthWeb.PageController do
  use AuthenticationphoenixuberauthWeb, :controller
  plug Ueberauth
  
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
