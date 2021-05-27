defmodule DeltaNu.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DeltaNu.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DeltaNu.PubSub}
      # Start a worker by calling: DeltaNu.Worker.start_link(arg)
      # {DeltaNu.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: DeltaNu.Supervisor)
  end
end
