window.addEventListener("load",function(){

   const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById('add-tax-price');
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      const profitCalculation = document.getElementById('profit');
      profitCalculation.innerHTML = Math.floor(inputValue * 1.1); 
   })

})