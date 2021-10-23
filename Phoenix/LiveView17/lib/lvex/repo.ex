defmodule Lvex.Repo do
  use Ecto.Repo,
    otp_app: :lvex,
    adapter: Ecto.Adapters.Postgres
end
