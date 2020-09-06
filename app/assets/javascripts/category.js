window.addEventListener("load", function() {
  let parent = document.querySelector("select#parent");
  console.log(parent)
  parent.addEventListener("change", function() {
    let parentValue = parent.value;
    console.log(parentValue)
    if(parentValue === "選択して下さい") {
      parent.addEventListener("blur", function() {
        console.log("フォーカスから離れました");
        // 子カテゴリーのセレクトタグを隠す実装が必要
      })
    } else {
      console.log("次は子カテゴリーを選択して下さい");
      
    }
  });
});