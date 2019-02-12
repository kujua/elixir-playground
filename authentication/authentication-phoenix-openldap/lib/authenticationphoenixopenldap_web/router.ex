defmodule AuthenticationphoenixopenldapWeb.Router do
  use AuthenticationphoenixopenldapWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuthenticationphoenixopenldapWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuthenticationphoenixopenldapWeb do
  #   pipe_through :api
  # end
end
