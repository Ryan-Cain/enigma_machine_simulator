defmodule EnigmaMachineSimulator.Repo do
  use Ecto.Repo,
    otp_app: :enigma_machine_simulator,
    adapter: Ecto.Adapters.Postgres
end
