# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :authenticationapiuberauth,
  ecto_repos: [Authenticationapiuberauth.Repo]

# Configures the endpoint
config :authenticationapiuberauth, AuthenticationapiuberauthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cEZg70U1Y9bLAzrU1TOF5fCaqnSc546tVuFJvN3njhjDE2Cry9LXVrwJV9QPjblk",
  render_errors: [view: AuthenticationapiuberauthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Authenticationapiuberauth.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
