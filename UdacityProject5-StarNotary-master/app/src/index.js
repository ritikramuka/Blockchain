import Web3 from "web3";
import starNotaryArtifact from "../../build/contracts/StarNotary.json";
require('../../app/src/styles/style.css');
const App = {

  web3: null,
  account: null,
  meta: null,

  start: async function() {
    const { web3 } = this;

    try {
      // get contract instance
      const networkId = await web3.eth.net.getId();
      const deployedNetwork = starNotaryArtifact.networks[networkId];
      this.meta = new web3.eth.Contract(
        starNotaryArtifact.abi,
        deployedNetwork.address,
      );

      // get accounts
      const accounts = await web3.eth.getAccounts();
      this.account = accounts[0];
    } catch (error) {
      console.error("Could not connect to contract or chain.");
    }
  },

    createStar: async function() {
    const { createStar } = this.meta.methods;
    const name = document.getElementById("starName").value;
    const id = document.getElementById("starId").value;
    let status = document.getElementById("status");
    if (isNaN(id) || id == '' || name == '') {
    status.innerHTML = `Star ID or Star Name cannot be Null & Star Id should be a Number!!`;
    status.style.color = "Red";
      return ;
    }else {
      status.innerHTML="";
      await createStar(name,id).send({from: this.account});
      status.style.color = "black";
      status.innerHTML = `Your data has been Saved with Id: ${id}`;
    }

  },


  // Implement Task 4 Modify the front end of the DAPP
  lookUptokenIdToStarInfo : async function() {
    const { lookUptokenIdToStarInfo } = this.meta.methods;
    let tokenId = document.getElementById('lookup-starid-textbox').value;
    let status = document.getElementById("lookup-star");
    if (isNaN(tokenId) || tokenId == '') {
      status.innerHTML = `Star name cannot be Null`;
      status.style.color = "Red";
      return ;
        } else {
      let starName = await lookUptokenIdToStarInfo(tokenId).call();
      if (starName == '') {
        status.innerHTML = `Did not find the Starname with Id: ${tokenId}`;
        status.style.color = "Red";
      }else {
      status.innerHTML = `Star name is ${starName}`;
      status.style.color = "black";
      }
    }

  }

};

window.App = App;

window.addEventListener("load", async function() {
  if (window.ethereum) {
    // use MetaMask's provider
    App.web3 = new Web3(window.ethereum);
    await window.ethereum.enable(); // get permission to access accounts
  } else {
    console.warn("No web3 detected. Falling back to http://127.0.0.1:9545. You should remove this fallback when you deploy live",);
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    App.web3 = new Web3(new Web3.providers.HttpProvider("http://127.0.0.1:9545"),);
  }

  App.start();
});
