$(document).ready(function(){
  $("button").on("click", function(e){
    var formData=$("#frm");
    var btn=$(this).data("btn");
    if(btn=='modify'){
      formData.attr("action", cPath + "/board/modify");
    }else if(btn=='remove'){
      formData.find('[name="title"], [name="content"]').prop("disabled", true);
      formData.attr("action", cPath + "/board/remove");
      formData.attr("method", "get")
    }else if(btn=='list'){
      formData.find('[name="recipeId"], [name="title"], [name="content"]').prop("disabled", true);
      formData.attr("action", cPath + "/board/list");
      formData.attr("method", "get")
    }
    formData.submit();    		
  });    	
});