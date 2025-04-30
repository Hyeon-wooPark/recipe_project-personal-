$(document).ready(function() {
  $("#regBtn").click(function(){
    location.href = cPath + "/query/insert";
  });

  $(".move").on("click", function(e){
    let queryId = $(this).data("id");
    let $textarea = $("#content" + queryId);
    let $countId = $("#count" + queryId);
    let $editBtn = $(".editBtn[data-id='" + queryId + "']");
    let $deleteBtn = $(".deleteBtn[data-id='" + queryId + "']");

    $editBtn.removeClass("d-none");
    $deleteBtn.removeClass("d-none");

    if ($textarea.data("loaded")) return;

    $.ajax({
      url : cPath + "/query/getQuery",
      method : "get",
      data : {queryId : queryId},
      dataType : "json",
      success : function(res) {
        $textarea
          .val(res.content)
          .data("original", res.content) 
          .data("loaded", true);
        $countId.text(res.count);
      },
      error : function() {
        $textarea.val("내용을 불러오는 데 실패했습니다.");
      }
    });
  });

  $('.collapse').on('hidden.bs.collapse', function () {
    let queryId = $(this).attr("id").replace("collapse", "");
    let $textarea = $("#content" + queryId);
    let $editBtn = $(".editBtn[data-id='" + queryId + "']");
  
    $textarea.val($textarea.data("original"));
    $textarea.prop("readonly", true);
  
    $editBtn.text("수정");
  });

  $(document).on("click", ".editBtn", function() {
    let queryId = $(this).data("id");
    let $textarea = $("#content" + queryId);
    let $btn = $(this);
  
    if ($textarea.prop("readonly")) {
      $textarea.prop("readonly", false).focus();
      $btn.text("저장");
    } else {
      let content = $textarea.val();
  
      $.ajax({
        url: cPath + "/query/update",
        method: "post",
        data: {
          queryId: queryId,
          content: content
        },
        success: function() {
          $textarea
            .prop("readonly", true)
            .data("original", content);
          $btn.text("수정");
          alert("수정이 완료되었습니다.");
        },
        error: function() {
          alert("수정 실패!");
        }
      });
    }
  });
});