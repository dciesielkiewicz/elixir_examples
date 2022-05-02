defmodule ElixirExamples.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirExamples.Repo,
      # Start the Telemetry supervisor
      ElixirExamplesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirExamples.PubSub},
      # Start the Endpoint (http/https)
      ElixirExamplesWeb.Endpoint
      # Start a worker by calling: ElixirExamples.Worker.start_link(arg)
      # {ElixirExamples.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirExamples.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirExamplesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
