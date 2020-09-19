$(document).on('input', '.image_upload', function(){
  //$liに追加するためのプレビュー画面のHTML
  var preview = $(`<div class="image-preview__wrapper">
                    <img class="preview">
                    <div class="image-preview_btn"><div class="image-preview_btn_edit">編集</div>
                    <div class="image-preview_btn_delete">削除</div>
                    </div>
                  </div>`); 
  //次の画像を読み込むためのinput。処理の最後にappendで追加する。 
  var append_input = $(`<li class="input">
                          <label class="upload-label">
                            <div class="items__image__upload__comment">
                              <i class="fas fa-camera"></i>
                              <p>ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</p>
                              <div class="input-area">
                                <input class="hidden image_upload" type="file">
                              </div>
                            </div>
                          </label>
                        </li>`);

  //こちらは5枚目と10枚目の投稿時のpタグの横幅を調整している。それ以外は同じ
  var append_input2 = $(`<li class="input">
                          <label class="upload-label">
                            <div class="items__image__upload__comment">
                              <i class="fas fa-camera"></i>
                              <p>ドラッグアンドドロップ<br>またはクリックして<br>ファイルをアップロード</p>
                              <div class="input-area">
                                <input class="hidden image_upload" type="file">
                              </div>
                            </div>
                          </label>
                        </li>`);

  //素材
  $ul = $('#previews')
  $li = $(this).parents('li');
  $label = $(this).parents('.upload-label');
  $inputs = $ul.find('.image_upload');

  //処理
  //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
  $('.image_upload').on('change', function (e) {
    //画像URLを取得
    var reader = new FileReader();
    //プレビューに追加させるために、inputから画像ファイルを読み込む
    reader.readAsDataURL(e.target.files[0]);

    //画像URLをimgに追加
    //画像ファイルが読み込んだら、処理が実行される。 
    reader.onload = function(e){
      //previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させる
      $(preview).find('.preview').attr('src', e.target.result);
    }

    //inputを保有するliにimgを追加
    $li.append(preview);
    
    //プレビュー完了後は、inputを非表示にさせる。これによりプレビューだけが残る。
    $label.css("display", "none");
    $li.removeClass("input");
    $li.addClass("image-preview");
    $lis = $ul.find(".image-preview");
    
    //"ul"に新しい"li(inputボタン)"を追加させる。
    if ($lis.length < 4) {
      $ul.append(append_input);
    } else if ($lis.length == 4) {
      $li.addClass("image-preview");
      $ul.append(append_input2);
    } else if ($lis.length == 5) {
      $li.addClass("image-preview");
      $ul.append(append_input);
    } else if ($lis.length < 9) {
      $li.addClass("image-preview");
      $ul.append(append_input);
    } else if ($lis.length == 9) {
      $li.addClass("image-preview");
      $ul.append(append_input2);
    }
    //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
    $inputs.each(function (num, input) {
      //nameの番号を更新するために、現在の番号を除去
      $(input).removeAttr("name");
      $(input).attr({
        id: "product_images_attributes_" + num + "_name",
        name: "product[images_attributes][" + num + "][name]",
      });
      console.log(input);
    });
  });
});