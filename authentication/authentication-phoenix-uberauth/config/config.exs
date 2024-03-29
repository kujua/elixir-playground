# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :authenticationphoenixuberauth,
  ecto_repos: [Authenticationphoenixuberauth.Repo]

# Configures the endpoint
config :authenticationphoenixuberauth, AuthenticationphoenixuberauthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XRqDvy6+UV1jNDZx9o4EMDZzLBIC2oI6Ekcw3mm9kJWYF0EEcYfLVYjPVTy76p5d",
  render_errors: [view: AuthenticationphoenixuberauthWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Authenticationphoenixuberauth.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
       providers: [
         identity: { Ueberauth.Strategy.Identity, [
           callback_methods: ["POST"],
           request_path: "/login/identity",
           callback_path: "/login/identity/callback"
         ]}
       ]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
