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
    IO.inspect(socket, label: "socket")
    updated_machine = EnigmaMachine.MixProject.key_press(socket.assigns.machine, payload["key"])
    broadcast(socket, "transmit", %{key: updated_machine.lampboard_key})
    {:noreply, assign(socket, :machine, updated_machine)}
  end
end
