defmodule Authenticationphoenixuberauth.Repo do
  use Ecto.Repo,
    otp_app: :authenticationphoenixuberauth,
    adapter: Ecto.Adapters.Postgres
end
