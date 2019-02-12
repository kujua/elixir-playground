# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :authenticationphoenixopenldap,
  ecto_repos: [Authenticationphoenixopenldap.Repo]

# Configures the endpoint
config :authenticationphoenixopenldap, AuthenticationphoenixopenldapWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MNcLq6o4/SPlIoMUpkgAAjq4sITCdwUi4u6Vgy21bd43NVb1ra21As+kMpNH1Nn+",
  render_errors: [view: AuthenticationphoenixopenldapWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Authenticationphoenixopenldap.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
