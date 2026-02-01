defmodule EnigmaMachineSimulatorWeb.MachineHTML do
  @moduledoc false
  use EnigmaMachineSimulatorWeb, :html

  def machine(assigns) do
    ~H"""
    <input id="machine-keyboard" type="text"/>
    """
  end
end
