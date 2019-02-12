# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :authentication,
  ecto_repos: [Authentication.Repo]

# Configures the endpoint
config :authentication, AuthenticationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gfD0gFpRCKM7fDNIE7VxbKZW64xDyT9EIMZWUc/Yzo3pjU1zlT0kxzTN9r7moV/3",
  render_errors: [view: AuthenticationWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Authentication.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :authentication, :pow,
       user: Authentication.Users.User,
       repo: Authentication.Repo
       
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
