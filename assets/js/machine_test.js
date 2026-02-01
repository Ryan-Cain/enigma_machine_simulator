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

    channel.on("transmit", (e) => {
      console.log(e.key);
      document.getElementById("output-text").innerText = e.key;
    });
  },
};

export default MachineTest;
