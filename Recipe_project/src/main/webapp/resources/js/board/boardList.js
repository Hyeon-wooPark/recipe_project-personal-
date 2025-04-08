$(document).ready(function(){
  $("#regBtn").click(function(){
    location.href = cPath + "/board/insert";;
  });
  
  var pageFrm=$("#pageFrm");
  $(".page-item a").on("click", function(e){
    e.preventDefault(); 
    var page=$(this).attr("href"); 
    pageFrm.find("#page").val(page);
    pageFrm.submit();    		
  });    	
 
  $(".move").on("click", function(e){
    e.preventDefault(); 
    let recipeId=$(this).attr("href");
    let tag="<input type='hidden' name='recipeId' value='"+recipeId+"'/>";
    pageFrm.append(tag);
    pageFrm.attr("action", cPath + "/board/getBoard");
    pageFrm.attr("method","get");
    pageFrm.submit();
  });
 });