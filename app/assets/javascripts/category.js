window.addEventListener("load", function() {
  let parent = document.querySelector("select#parent");
  console.log(parent)
  parent.addEventListener("change", function() {
    console.log("親カテゴリーが選択されました");
    alert("親カテゴリーが選択されました");
  });
});