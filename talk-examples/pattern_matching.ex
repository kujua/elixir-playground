defmodule PatternMatching do
  @moduledoc false


  current_user_id = "eyJhbGciOiJIUzI1NiIsInR5cCI6"
  "eyJhbGciOiJIUzI1NiIsInR5cCI6" = current_user_id
  current_user_id = get_session(conn, :current_user_id)
  {:ok, pid} = DynamicSupervisor.start_child(Logic.Supervisor, Logic.Worker)
  %{"pagesize" => pagesize, "page" => page} = params
  <<"TRIPIQ_CONFIG", valid :: size(8), group :: size(8)>> = <<"TRIPIQ_CONFIG", 1, 99 >>
  { users, count} = Auth.list_users(predicate)
  { users, _} = Auth.list_users(predicate)
  { users, _count} = Auth.list_users(predicate)
  { otherusers, _count} = Auth.list_users(predicate)
  def show(conn, %{"id" => id}) do
    pizza = Model.get_pizza!(id)
    render(conn, "show.json", pizza: pizza)
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  defp validate_pass(%{other: %{password: ""}}) do
    {:error, "Password required"}
  end

  def render("404.html", _assigns) do  end
  def render("500.html", _assigns) do  end
  def render("401.json", %{message: message}) do  end
  def render("404.json", _assigns) do  end
  def render(_, _assigns) do  end

  def index(conn, params) when params == %{} do end
  def show(conn, %{"id" => id}) when is_integer(id) do  end

  case Safiriservice.Auth.authenticate_user(email, password) do
    {:ok, user} ->
      conn
      |> put_session(:current_user_id, user.id)
      |> put_status(:ok)
      |> render(SafiriService.Web.UserView, "sign_in.json", user: user)

    {:error, message} ->
      conn
      |> delete_session(:current_user_id)
      |> put_status(:unauthorized)
      |> render(SafiriService.ErrorView, "401.json", message: message)
  end

  _ = 42 # -> 42

  [head | tail] = [1, 2, 3]


end
