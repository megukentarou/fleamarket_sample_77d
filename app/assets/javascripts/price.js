$(window).on("load", function(){
  // 販売価格を入力してイベントを発火させる
  $(".items__price__form").on("blur", function(){
    var itemPrice = Number($(this).val());
    // 販売価格が最低1円以上でないとアラートが出る
    if(itemPrice < 1){
      alert('最低¥1以上は入力して下さい');
    }
  });
});