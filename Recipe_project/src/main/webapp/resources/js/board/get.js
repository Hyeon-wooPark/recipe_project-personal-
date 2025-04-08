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
      let rId = $("#reviewId").val();
        $("#updateForm-" + rId).submit();
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