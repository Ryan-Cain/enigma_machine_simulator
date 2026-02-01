let MachineTest = {
  init(socket) {
    let channel = socket.channel("enigma_machine_connection:transmit", {});
    channel.join();
    this.listenForTransmissions(channel);
  },

  listenForTransmissions(channel) {
    console.log(channel);
    document
      .getElementById("machine-keyboard")
      .addEventListener("keydown", function (e) {
        channel.push("transmit", { key: e.key });
      });
  },
};

export default MachineTest;
