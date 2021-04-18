window.addEventListener('load', function(){
  const item_price = document.getElementById("item-price")
  const add_tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  item_price.addEventListener("input", () => {
    const inputPrice = item_price.value
    const inputTaxPrice = inputPrice * 0.1
    
    add_tax_price.innerText = inputTaxPrice
    profit.innerText = inputPrice - inputTaxPrice
  })

})