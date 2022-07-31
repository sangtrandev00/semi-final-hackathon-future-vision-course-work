const clickBtn = document.querySelector(".connect");
console.log(clickBtn);


function handleConnectWallet() {

  
    clickBtn.addEventListener("click",onBtnConnect);
    
    async function onBtnConnect() {
      // outputWrite('onBtnConnect() call');
      const response = await window.ic?.plug?.requestConnect();
      // outputWrite(`onBtnConnect() call response ${response}`);
      console.log(response);
    }
}

handleConnectWallet();