window.addEventListener('turbo:load', () => {
  console.log("OK");
});

function validatePrice() {
  const priceInput = document.querySelector('input[name="item[price]"]');
  const priceError = document.getElementById('price-error');
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

  const price = parseInt(priceInput.value, 10);
  if (isNaN(price) || price < 300 || price > 9999999) {
    taxPrice.innerHTML = '';
    profit.innerHTML = '';
  } else {
    const fee = Math.floor(price * 0.1); // 販売手数料は10%
    const netProfit = price - fee;

    taxPrice.innerHTML = fee.toLocaleString() + '円';
    profit.innerHTML = netProfit.toLocaleString() + '円';
  }
}

document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.querySelector('input[name="item[price]"]');
  if (priceInput) {
    priceInput.addEventListener('input', function() {
      validatePrice();
      calculateProfit();
    });
  }
});
