document.addEventListener('turbo:load', () => {
  initializePriceCalculation();
});

document.addEventListener('DOMContentLoaded', () => {
  console.log("DOMContentLoaded event fired");
  initializePriceCalculation();
});

function initializePriceCalculation() {
  const priceInput = document.querySelector('input[name="item[price]"]');
  if (priceInput) {
    priceInput.addEventListener('input', () => {
      validatePrice();
      calculateProfit();
    });
  } else {
    console.error("Price input element not found");
  }
}

function validatePrice() {
  const priceInput = document.querySelector('input[name="item[price]"]');
  const priceError = document.getElementById('price-error');
  if (!priceError) {
    console.error("Price error element not found");
    return;
  }

  const price = parseInt(priceInput.value, 10);
  if (isNaN(price) || price < 300 || price > 9999999) {
    priceError.style.display = 'inline';
  } else {
    priceError.style.display = 'none';
  }
}

function calculateProfit() {
  const priceInput = document.querySelector('input[name="item[price]"]');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput || !taxPrice || !profit) {
    console.error("One or more elements for calculation not found");
    return;
  }

  const price = parseInt(priceInput.value, 10);
  if (isNaN(price) || price < 300 || price > 9999999) {
    taxPrice.innerHTML = '';
    profit.innerHTML = '';
  } else {
    const fee = Math.floor(price * 0.1); // 販売手数料は10%
    const netProfit = price - fee;

    taxPrice.innerHTML = fee.toLocaleString() + '';
    profit.innerHTML = netProfit.toLocaleString() + '';
  }
}