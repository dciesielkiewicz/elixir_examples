defmodule ElixirExamples.Repo do
  use Ecto.Repo,
    otp_app: :elixir_examples,
    adapter: Ecto.Adapters.Postgres
end
