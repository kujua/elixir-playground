defmodule AuthenticationphoenixuberauthWeb.PageController do
  use AuthenticationphoenixuberauthWeb, :controller
  plug Ueberauth

#  def index(conn, params) when params == %{} do
#    render(conn, "index.html", current_user: nil, p: "---")
#  end

#  def index(conn, %{"email" => p}) do
#    render(conn, "index.html", current_user: get_session(conn, :current_user), p: p)
#  end

    def index(conn, _params) do
      render(conn, "index.html", current_user: get_session(conn, :current_user))
    end

end
