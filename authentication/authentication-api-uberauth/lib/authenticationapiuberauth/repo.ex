defmodule Authenticationapiuberauth.Repo do
  use Ecto.Repo,
    otp_app: :authenticationapiuberauth,
    adapter: Ecto.Adapters.Postgres
end
