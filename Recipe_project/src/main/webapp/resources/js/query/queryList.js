$(document).ready(function() {
  $("#regBtn").click(function(){
    location.href = cPath + "/query/insert";
  });

  $(".move").on("click", function(e){
    let queryId = $(this).data("id");
    let $titleInput = $("#title" + queryId);
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
        $titleInput
          .val(res.title)
          .data("original", res.title);

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
    let $titleInput = $("#title" + queryId);
    let $textarea = $("#content" + queryId);
    let $editBtn = $(".editBtn[data-id='" + queryId + "']");
  
    $titleInput
      .val($titleInput.data("original"))
      .prop("readonly", true);

    $textarea
      .val($textarea.data("original"))
      .prop("readonly", true)
      .data("loaded", false);
  
    $editBtn.text("수정");
  });

  $(document).on("click", ".editBtn", function() {
    let queryId = $(this).data("id");
    let $titleInput = $("#title" + queryId);
    let $textarea = $("#content" + queryId);
    let $btn = $(this);
  
    if ($textarea.prop("readonly")) {
      $titleInput.prop("readonly", false);
      $textarea.prop("readonly", false).focus();
      $btn.text("저장");
    } else {
      let title = $titleInput.val();
      let content = $textarea.val();
  
      $.ajax({
        url: cPath + "/query/update",
        method: "post",
        data: {
          queryId: queryId,
          title : title,
          content: content
        },
        success: function() {
          $titleInput
            .prop("readonly", true)
            .data("original", title);
          $textarea
            .prop("readonly", true)
            .data("original", content);
          $("a[data-id='" + queryId + "']").text(title);
          $btn.text("수정");
          alert("수정이 완료되었습니다.");
        },
        error: function() {
          alert("수정 실패!");
        }
      });
    }
  });

  $(document).on("click", ".deleteBtn", function() {
    let queryId = $(this).data("id");
    $("#deleteQueryId").val(queryId);
    $("#deleteModal").modal("show");
  });

  $(document).on("submit", "#deleteForm", function(e) {
    e.preventDefault();

    let queryId = $("#deleteQueryId").val();

    $.ajax({
      url: cPath + "/query/delete",
      method: "post",
      data: { queryId: queryId },
      success: function() {
        $("#collapse" + queryId).closest("tr").prev().remove();
        $("#collapse" + queryId).fadeOut();
        $("#deleteModal").modal("hide");
        alert("삭제되었습니다.");
      },
      error: function() {
        alert("삭제에 실패했습니다.");
      }
    });
  });
});