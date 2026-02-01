defmodule EnigmaMachineSimulatorWeb.EnigmaMachineConnectionChannel do
  use EnigmaMachineSimulatorWeb, :channel

  @impl true
  def join("enigma_machine_connection:transmit", _payload, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end
end
