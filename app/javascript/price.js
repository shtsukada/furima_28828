function price() {
  const input_price =document.getElementById("item-price");
  const tax = 0.1;
  const profit = 1.0 - tax;
  const tax_price = document.getElementById("add-tax-price");
  const profit_price = document.getElementById("profit");

  input_price.addEventListener("input", () => {
    tax_price.innerHTML = ((input_price.value) * tax);
    profit_price.innerHTML = ((input_price.value) * profit);
  });

}

window.addEventListener("load", price);
