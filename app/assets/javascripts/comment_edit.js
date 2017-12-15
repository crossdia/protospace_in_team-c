$(function() {
  function editComment(comment){
    var form =
    `<form action="/prototypes/${comment.prototype_id}/comments/${comment.id}" accept-charset="UTF-8" method="post">
       <input type="hidden" name="_method" value="patch" />
       <input type="text" name="text" value="${comment.text}" />
       <input type="submit" name="commit" class="comment_update" value="EDIT" />`
    var html = "#comment_" + comment.id
    $(html).html(form);
  }

  $(".comment_edit").on("click", function(e) {
    e.preventDefault();
    var url = $(this).attr("href");
    console.log(url);
    $.ajax({
      url: url,
      type: "GET",
      dataType: "json"
    })
    .done(function(data){
      editComment(data);
    });
  });
})
