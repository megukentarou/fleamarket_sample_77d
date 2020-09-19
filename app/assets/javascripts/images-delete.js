//削除ボタンをクリックしたとき、処理が動く。
$(document).on('click','.image-preview_btn_delete',function(){
  
  //素材
  $ul = $('#previews')
  $li = $(this).parents('li');
  $label = $(this).parents('.upload-label');
  $inputs = $ul.find('.image_upload');

  //"li"ごと削除して、previewとinputを削除させる。
  $li.remove();

  console.log($inputs)
});