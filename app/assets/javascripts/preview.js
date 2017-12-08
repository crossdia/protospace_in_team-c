$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('#prototype_captured_images_attributes_0_content').parent().on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $('#prototype_captured_images_attributes_0_content').parent();
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.find("img").remove();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  height: "100%",
                  id: "prototype_captured_images_attributes_0_content",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});

$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('#prototype_captured_images_attributes_1_content').parent().on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $('#prototype_captured_images_attributes_1_content').parent();
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.find("img").remove();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  height: "100%",
                  id: "prototype_captured_images_attributes_1_content",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});


$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('#prototype_captured_images_attributes_2_content').parent().on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $("#prototype_captured_images_attributes_2_content").parent();
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.find("img").remove();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  height: "100%",
                  id: "prototype_captured_images_attributes_2_content",
                  title: file.name
              }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('#prototype_captured_images_attributes_3_content').parent().on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $("#prototype_captured_images_attributes_3_content").parent();
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.find("img").remove();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  height: "100%",
                  id: "prototype_captured_images_attributes_3_content",
                  title: file.name
              }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
