document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('charge-form') != null) {
    Payjp.setPublicKey('your-public-key'); // 公開鍵を設定

    const form = document.getElementById('charge-form');
    form.addEventListener('submit', (e) => {
      e.preventDefault();

      const card = {
        number: document.getElementById('card-number').value,
        exp_month: document.getElementById('expiry-form').value.split('/')[0],
        exp_year: document.getElementById('expiry-form').value.split('/')[1],
        cvc: document.getElementById('cvc-form').value,
      };

      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          document.getElementById('card-number').removeAttribute('name');
          document.getElementById('expiry-form').removeAttribute('name');
          document.getElementById('cvc-form').removeAttribute('name');
          
          document.getElementById('charge-form').insertAdjacentHTML(
            'beforeend', 
            `<input type="hidden" name="token" value="${response.id}">`
          );

          form.submit();
        } else {
          alert('カード情報が正しくありません。');
        }
      });
    });
  }
});
