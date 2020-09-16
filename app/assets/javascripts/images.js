$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    console.log("フォームの追加")
    const html = `<input value="" class="file_field" type="file" name="item[images_attributes][${num}][src]" id="item_images_attributes_${num}_src">`;
    return html;
  }

  $(document).on("click", ".file_field", function() {
  // 素材を表示
      $ul = $("#previews");
      $li = $(this).parents("li");
      $label = $(this).parents(".items__image__upload");
      $label.css("display", "none");
      $inputs = $ul.find(".file_field");
      // $liに追加する為のプレビュー画面のHTML
      var preview = $(
        `<div class="image-preview__wrapper">
          <img class="preview">
        </div>
        <div class="image-preview_btn">
          <div class="image-preview_btn_edit">編集</div>
          <div class="image-preview_btn_delete">削除</div>
        </div>`
      );
      $(preview).find(".preview").attr("src", e.target.result);
      // <img class="preview">をfindで指定
      // attrでimgタグにsrcを挿入

      // 次の画像を読み込む為のinput 処理の最後にappendで追加する
      var append_input = $(
        `<li class="input">
            <label class="ipload-label">
              <div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード
                <div class="input-area">
                  <input class="hidden image_upload" type="file">
                </div>
              </div>
            </label>
          </li>`
      );  
  })
  
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 処理
  // 画像をファイル選択して中身が変更（追加）されたらイベント発火
  $('.file_field').on('change', function(e) {
      // 画像のURLを取得
      var reader = new FileReader();
      // プレビューに追加させる為に、inputから画像ファイルを読み込む
      reader.readAsDataURL(e.target.files[0]);
      console.log(reader);

      // 画像URLをimgに追加
      // 画像ファイルを読み込んだら、処理が実行される
      reader.onload = function(e) {
        $(preview).find(".preview").attr("src", e.target.result);
      }
      
      // inputを保有する、liにimgを追加
      $li.append(preview);

      // fileIndexの先頭の数字を使ってinputを作る
      // $('.items__image__upload__comment').append(buildFileField(fileIndex[0]));
      // fileIndex.shift();
      // // 末尾の数に1足した数を追加する
      // fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  // $('items__image__upload__comment').on('click', '.js-remove', function() {
  //   $(this).parent().remove();
  //   // 画像入力欄が0個にならないようにしておく
  //   if ($('.js-file').length == 0) $('items__image__upload__comment').append(buildFileField(fileIndex[0]));
  // });
});