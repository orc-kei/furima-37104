function pullDown() {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
    const addProfitDom = document.getElementById("profit");
    // console.log(priceInput.innerHTML);
    addProfitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))

  })

};




window.addEventListener('load', pullDown)
