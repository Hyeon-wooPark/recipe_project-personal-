$(document).ready(function() {
  $("#regBtn").click(function(){
    location.href = cPath + "/query/insert";
  });

  $(".move").on("click", function(e){
    let queryId = $(this).data("id");
    let $textarea = $("#content" + queryId);

    if($textarea.val().trim() !== "") return;

    $.ajax({
      url : cPath + "/query/getQuery",
      method : "get",
      data : {queryId : queryId},
      dataType : "text",
      success : function(data) {
        $textarea.val(data);
      },
      error : function() {
        $textarea.val("내용을 불러오는 데 실패했습니다.");
      }
    });
  });
});