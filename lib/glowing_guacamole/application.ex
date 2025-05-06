defmodule GlowingGuacamole.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GlowingGuacamoleWeb.Telemetry,
      GlowingGuacamole.Repo,
      {DNSCluster, query: Application.get_env(:glowing_guacamole, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GlowingGuacamole.PubSub},
      # Start a worker by calling: GlowingGuacamole.Worker.start_link(arg)
      # {GlowingGuacamole.Worker, arg},
      # Start to serve requests, typically the last entry
      GlowingGuacamoleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GlowingGuacamole.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GlowingGuacamoleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
