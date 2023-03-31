defmodule MausritterChargen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MausritterChargenWeb.Telemetry,
      # Start the Ecto repository
      MausritterChargen.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MausritterChargen.PubSub},
      # Start Finch
      {Finch, name: MausritterChargen.Finch},
      # Start the Endpoint (http/https)
      MausritterChargenWeb.Endpoint
      # Start a worker by calling: MausritterChargen.Worker.start_link(arg)
      # {MausritterChargen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MausritterChargen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MausritterChargenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
