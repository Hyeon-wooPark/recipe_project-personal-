<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>게시글 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <jsp:include page="../main/header.jsp"></jsp:include>
  <script type="text/javascript">
	  $(document).ready(function(){
	  	$("button").on("click", function(e){
	  		var formData=$("#frm");
	  		var btn=$(this).data("btn");
	  		if(btn=='modify'){
	  			formData.attr("action", "${cPath}/board/modify");
	  		}else if(btn=='remove'){
	  			formData.find("#title").remove();
	  			formData.find("#content").remove();
	  			formData.attr("action", "${cPath}/board/remove");
	  			formData.attr("method", "get")
	  		}else if(btn=='list'){
	  			formData.find("#recipeId").remove();
	  			formData.find("#title").remove();
	  			formData.find("#content").remove();
	  			formData.attr("action", "${cPath}/board/list");
	  			formData.attr("method", "get")
	  		}
	  		formData.submit();    		
	  	});    	
	  });
  </script>
</head>
<body>
 
<div class="container">
  <h1>수정</h1>
  <div class="card">
    <div class="card-body">
    <form id="frm" method="post">
      <table class="table table-bordered">
         <tr>
          <td>번호</td>
          <td><input type="text" class="form-control" name="recipeId" readonly="readonly" value="${vo.recipeId}"/></td>
         </tr>
         <tr>
          <td>제목</td>
          <td><input type="text" class="form-control" name="title" value="<c:out value='${vo.title}'/>"/></td>          
         </tr>
         <tr>
          <td>내용</td>
          <td><textarea rows="10" class="form-control" name="content"><c:out value='${vo.content}'/></textarea> </td>
         </tr>
         <tr>
          <td>작성자</td>
          <td><input type="text" class="form-control" readonly="readonly" value="${vo.writer}"/></td>
         </tr>
         <tr>
           <td colspan="2" style="text-align: center;">
              <c:if test="${!empty mvo && mvo.userId eq vo.userId}">
                	<button type="button" data-btn="modify" class="btn btn-sm btn-success">수정</button>
              		<button type="button" data-btn="remove" class="btn btn-sm btn-warning">삭제</button>
              </c:if>
              <c:if test="${empty mvo || mvo.userId ne vo.userId}">
                <button disabled="disabled" type="button" class="btn btn-sm btn-primary">수정</button>
                <button disabled="disabled" type="button" class="btn btn-sm btn-warning">삭제</button> 
              </c:if>
              <button type="button" data-btn="list" class="btn btn-sm btn-info">목록</button>
           </td>
         </tr>
      </table>
          <input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
          <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>
          <input type="hidden" name="type" value="<c:out value='${cri.type}'/>"/>
          <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"/>
      </form>
    </div>
  </div>
</div>

</body>
</html>