$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    let html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    let childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper' id='children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="children_category" name="category_id">
                            <option value="選択して下さい" data-category="---">選択して下さい</option>
                            ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    $('.items__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchildrenBox(insertHTML){
    let grandchildSelectHtml = `<div class='listing-select-wrapper' id='grandchildren_wrapper'>
                                  <div class='listing-select-wrapper__box'>
                                    <select class='listing-select-wrapper__box--select' id='grandchildren_category' name='category_id'>
                                      <option value='選択して下さい' data-category="---">選択して下さい</option>
                                      ${insertHTML}
                                    </select>
                                  </div>
                                </div>`;
    $('.items__category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    let parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "選択して下さい"){ //親カテゴリーが初期値の"選択して下さい"でないことを確認
      $.ajax({
        url: 'get_children_category',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        let insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.items__category').on("change", '#children_category', function(){
    let childId = $('#children_category option:selected').data('category'); //選択された子カテゴリーのid取得
    if (childId != "---"){//子カテゴリーが初期値で無い事を確認
      $.ajax({
        url: 'get_grandchildren_category',
        type: 'GET',
        data: { child_id: childId},
        dataType: 'json'
      })
      .done(function(grandchildren){
        if(grandchildren.length != 0){
          $('#grandchildren_wrapper').remove();//子が変更された時、孫以下を削除する
          let insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリーの取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  });
});