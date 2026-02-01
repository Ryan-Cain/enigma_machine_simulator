defmodule EnigmaMachineSimulatorWeb.MachineController do
  @moduledoc false
  use EnigmaMachineSimulatorWeb, :controller

  def machine(conn, _params) do
    render(conn, :machine, layout: false)
  end
end
