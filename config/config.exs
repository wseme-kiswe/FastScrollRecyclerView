# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :delta_nu,
  ecto_repos: [DeltaNu.Repo]

config :delta_nu_web,
  ecto_repos: [DeltaNu.Repo],
  generators: [context_app: :delta_nu]

# Configures the endpoint
config :delta_nu_web, DeltaNuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LJmusq3+c5AHc1k/MYCGS5N5CqVeOCJ2YsCHHwuF6FjVzhNrsvyunS+EMOzB/l6Z",
  render_errors: [view: DeltaNuWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DeltaNu.PubSub,
  live_view: [signing_salt: "Y8XB95uN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
