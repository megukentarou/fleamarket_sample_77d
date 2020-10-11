document.addEventListener(
  'turbolinks:load', e => {
    if ($("#card_form") != null) {
      Payjp.setPublicKey("sk_test_71d0ee81ed35c0a94d205d89");
      const submitBtn = $("#token_submit")
      submitBtn.on("click", (e) => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("card_cvc").value,
          exp_month: document.getElementById("card_exp_month").value,
          exp_year: document.getElementById("card_exp_year").value
        };
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#card_cvc").removeAttr("name");
            $("#card_exp_month").removeAttr("name");
            $("#card_exp_year").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );
            alert("登録が完了しました");
            $("#card_form")[0].submit();
          } else {
            alert("カード情報が正しくありません。");
          }
        });
      });
    }
  }
);
