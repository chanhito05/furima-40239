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

document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.querySelector('input[name="item[price]"]');
  if (priceInput) {
    priceInput.addEventListener('input', validatePrice);
  }
});
