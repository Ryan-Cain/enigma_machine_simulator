defmodule EnigmaMachineSimulatorWeb.EnigmaMachineConnectionChannel do
  use EnigmaMachineSimulatorWeb, :channel

  @impl true
  def join("enigma_machine_connection:transmit", _payload, socket) do
    machine = EnigmaMachine.MixProject.get_default_state()
    IO.inspect(machine, label: "machine", label: "machine")
    {:ok, assign(socket, :machine, machine)}
  end

  @impl true
  def handle_in("transmit", payload, socket) do
    IO.inspect(payload, label: "payload")
    key = String.to_atom(payload["key"])
    EnigmaMachine.MixProject.key_press(socket, key)
    broadcast(socket, "transmit", payload)
    {:noreply, socket}
  end
end
