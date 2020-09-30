$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][url]"
                    id="item_images_attributes_${index}_url">
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="image-container">
                    <img data-index="${index}" src="${url}">
                    <div class="image-edit">
                      <div class="js-remove">削除</div>
                      <div class="js-edit" data-index="${index}">編集</div>                      
                    </div>
                  </div>`;
  return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.image-label').before(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.items__image__upload__comment').append(buildFileField(fileIndex[0]));
      $(".image-label").attr("for", `item_images_attributes_${fileIndex[0]}_url`)
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    var preview_count = $('.image-container').length
    console.log(preview_count);
    
    // ビューが5枚になるとinputフィールドが消える
    if(preview_count == 5) {
      $('.image-label').css({'display': 'none'});
    }
  });
  // 削除の編集（差し替え）イベント
  $('#previews').on('click', '.js-edit', function() {
    const editIndex = $(this).data('index');
    console.log(editIndex);
    $(`#item_images_attributes_${editIndex}_url`).click();
  });

  // 画像の削除イベント
  $('#previews').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().prev().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    console.log(targetIndex);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().parent().remove();
    console.log(this);
    $(`#item_images_attributes_${targetIndex}_url`).parent().remove();
    
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file_group').Count == 0) $('.items__image__upload').append(buildFileField(fileIndex[0]));
    // inputフィールドを再度出現させる
    $('.image-label').css({'display': 'flex'}); 
  });

  // エラーハンドリングの実装
  
  // 商品名が空白の場合にエラーメッセージ出現
  $('#item_name').on('blur', function() {
    var itemname = $('#item_name').Value;
    console.log(itemname);
    if($('#item_name').Value == "") {
      console.log("商品名を入力してください")
    }
  });
});


