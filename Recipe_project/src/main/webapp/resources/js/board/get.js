$(document).ready(function(){
  
  $("button").on("click", function(e){
    let formData=$("#frm");
    let replyData = $("#com");
    let btn=$(this).data("btn");
    
    if(btn=='modify'){
      formData.attr("action", cPath + "/board/modify");
    }else if(btn=='list'){
      formData.find("#recipeId").remove();
      formData.attr("action", cPath + "/board/list");
    }else if(btn=='reply') {
      replyData.attr("action", cPath + "/review/insert");
      replyData.submit();
      return;
    } else if(btn=='update') {
      let id = $(this).data("id");
      $("#updateForm-" + id).toggleClass("d-none");
      return;
    } else if(btn=='updateReview') {
      let form = $(this).closest("form");
      form.submit();
      return;
    } else if(btn == 'delete') {
      let id = $(this).data("id");
      $("#deleteReviewId").val(id);
      $("#deleteModal").modal("show");
      return;
    } else if(btn == 'subReply') {
      let id = $(this).data("id");
      $("#replyForm-" + id).toggleClass("d-none");
      return;
    } else if(btn == 'insertReview') {
      let form = $(this).closest("form");
      form.submit();
      return;
    }
    formData.submit();    		
  });
  
  var pageFrm=$("#pageFrm");
  $(".page-item a").on("click", function(e){
    e.preventDefault();
    var page=$(this).attr("href");
    pageFrm.find("#rpage").val(page);
    pageFrm.submit();   		
  });
});