defmodule EnigmaMachineSimulator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EnigmaMachineSimulatorWeb.Telemetry,
      EnigmaMachineSimulator.Repo,
      {DNSCluster, query: Application.get_env(:enigma_machine_simulator, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EnigmaMachineSimulator.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EnigmaMachineSimulator.Finch},
      # Start a worker by calling: EnigmaMachineSimulator.Worker.start_link(arg)
      # {EnigmaMachineSimulator.Worker, arg},
      # Start to serve requests, typically the last entry
      EnigmaMachineSimulatorWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EnigmaMachineSimulator.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EnigmaMachineSimulatorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
