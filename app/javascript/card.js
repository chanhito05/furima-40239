const pay = () => {
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey) // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
document.addEventListener('DOMContentLoaded', () => {
  console.log("DOMContentLoaded event fired");
  initializePriceCalculation();
  initializePayjp();
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

    taxPrice.innerHTML = `${fee.toLocaleString()}`; // 単位を明示的に
    profit.innerHTML = `${netProfit.toLocaleString()}`; // 単位を明示的に
  }
}

function initializePayjp() {
  Payjp.setPublicKey('914a8a1322d306b4d97fe1f7'); // 公開鍵を設定

  const form = document.getElementById('charge-form');
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const card = {
      number: document.getElementById('card-number').value,
      cvc: document.getElementById('card-cvc').value,
      exp_month: document.getElementById('card-exp-month').value,
      exp_year: document.getElementById('card-exp-year').value
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        document.getElementById('card-number').removeAttribute('name');
        document.getElementById('card-cvc').removeAttribute('name');
        document.getElementById('card-exp-month').removeAttribute('name');
        document.getElementById('card-exp-year').removeAttribute('name');

        const token = response.id;
        const hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'payment_form[token]');
        hiddenInput.setAttribute('value', token);
        form.appendChild(hiddenInput);

        form.submit();
      } else {
        alert('カード情報が正しくありません。');
      }
    });
  });
}
