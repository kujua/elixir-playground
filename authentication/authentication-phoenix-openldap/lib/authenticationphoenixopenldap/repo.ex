defmodule Authenticationphoenixopenldap.Repo do
  use Ecto.Repo,
    otp_app: :authenticationphoenixopenldap,
    adapter: Ecto.Adapters.Postgres
end
