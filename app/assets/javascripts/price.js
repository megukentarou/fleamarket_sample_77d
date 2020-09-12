$(document).on("turbolinks:load", function(){
  // 販売価格を入力してイベントを発火させる
  $(".items__price__form").keyup (function(){
    var itemPrice = Number($(this).val());
    // 販売価格が300円以上なら手数料・利益が表示されるイベント
    if(itemPrice >= 300 && itemPrice < 10000000){
      let fee = Math.floor(itemPrice * 0.1);
      let profit = itemPrice - fee;
      $("#item__fee").text("¥ " + fee.toLocaleString()),
      $("#item__profit").text("¥ " + profit.toLocaleString());
    }else{
      $("#item__fee").text("--"),
      $("#item__profit").text("--");
    }
  });
});