<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>게시글</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <jsp:include page="../main/header.jsp"></jsp:include>
  <script type="text/javascript">
    $(document).ready(function(){
    	$("button").on("click", function(e){
    		let formData=$("#frm");
    		let replyData = $("#com");
    		let btn=$(this).data("btn"); // data-btn="list"
    		if(btn=='modify'){
    			formData.attr("action", "${cPath}/board/modify");
    		}else if(btn=='list'){
    			formData.find("#recipeId").remove();
    			formData.attr("action", "${cPath}/board/list");
    		}else if(btn=='reply') {
    			replyData.attr("action", "${cPath}/review/insert");
    			replyData.submit();
    			return;
    		}
    		formData.submit();    		
    	});
    	
    	var pageFrm=$("#pageFrm");
    	$(".page-item a").on("click", function(e){
    		e.preventDefault(); // a tag의 기능을 막는 부분
    		var page=$(this).attr("href"); // 페이지번호
    		pageFrm.find("#rpage").val(page);
    		pageFrm.submit();   		
    	});
    });
  </script>
</head>
<body>
 
<div class="container">
  
  <h1>게시글</h1>
  <div class="card">
    <div class="card-body">
      <table class="table table-bordered">
         <tr>
          <td>번호</td>
          <td><input type="text" class="form-control" readonly="readonly" value="${vo.recipeId}"/></td>
         </tr>
         <tr>
          <td>제목</td>
          <td><input type="text" class="form-control" readonly="readonly" value="<c:out value='${vo.title}'/>"/></td>          
         </tr>
         <tr>
          <td>내용</td>
          <td><textarea rows="10" class="form-control" readonly="readonly"><c:out value='${vo.content}'/></textarea> </td>
         </tr>
         <tr>
          <td>작성자</td>
          <td><input type="text" class="form-control" readonly="readonly" value="${vo.writer}"/></td>
         </tr>
         <tr>
           <td colspan="2" style="text-align: center;">
              <c:if test="${!empty mvo && mvo.userId eq vo.userId}">
                	<button data-btn="modify" class="btn btn-sm btn-success">수정</button>
              </c:if>
              <c:if test="${empty mvo || mvo.userId ne vo.userId}">
                <button disabled="disabled" class="btn btn-sm btn-success">수정</button> 
              </c:if>
              <button data-btn="list" class="btn btn-sm btn-info">목록</button>
           </td>
         </tr>
      </table>
      <form id="frm" method="get">
          <input type="hidden" id="recipeId" name="recipeId" value="<c:out value='${vo.recipeId}'/>"/> 
          <input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
          <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>
          <input type="hidden" name="type" value="<c:out value='${cri.type}'/>"/>
          <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"/>
      </form>
    </div>
  </div>
  <div class="card mt-4">
  	<div class="card-header">댓글</div>
  	<form id="com" method="post">
	  	<div class="card-body">
	  		<div class="mb-3">
	  			<input type="hidden" name="recipeId" value="<c:out value='${vo.recipeId}'/>"/>
	  			
	  			<textarea class="form-control" name="comment" rows="3" placeholder="댓글을 입력하세요..."></textarea>
	  			<div class="d-flex justify-content-end mt-2">
	  				<c:if test="${empty mvo}">
	  					<button disabled="disabled" data-btn="reply" class="btn btn-sm btn-primary">답글</button>
	  				</c:if>
	  				<c:if test="${!empty mvo}">
	  					<button data-btn="reply" class="btn btn-sm btn-primary">답글</button>
	  				</c:if>
				</div>
	  		</div>
	  		<input type="hidden" name="viewWriter" value="<c:out value='${mvo.nick}'/>"/>
	  		<input type="hidden" id="recipeId" name="recipeId" value="<c:out value='${vo.recipeId}'/>"/> 
            <input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
            <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>
            <input type="hidden" name="type" value="<c:out value='${cri.type}'/>"/>
            <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"/>
	  		<input type="hidden" name="rpage" value="<c:out value='${rcri.rpage}'/>"/>
            <input type="hidden" name="rperPageNum" value="<c:out value='${rcri.rperPageNum}'/>"/>
	  	</div>
  	</form>
  </div>
  <div class="list-group list-group-flush">
  	  <h1>댓글 ${rpageMaker.totalCount}개</h1>
      <c:forEach var="vo" items="${list}">
        <div class="list-group-item d-flex flex-row align-items-center">
          <h6 class="mb-1 me-3">${vo.viewWriter}</h6>
          <p class="mb-1 flex-grow-1 text-start"><c:out value="${vo.comment}"/></p>
          <small class="text-muted">${vo.createComment}</small>
        </div>
      </c:forEach>
  </div>
  <!-- 페이징 START -->
   <div class="d-flex justify-content-center">
  <ul class="pagination">
   <!-- 이전처리 -->
   <c:if test="${rpageMaker.prev}">
     <li class="page-item">
       <a class="page-link" href="${rpageMaker.startPage-1}">◀</a>
     </li>
   </c:if>      
   <!-- 페이지번호 처리 -->
       <c:forEach var="pageNum" begin="${rpageMaker.startPage}" end="${rpageMaker.endPage}">
       <li class="page-item ${rpageMaker.rcri.rpage==pageNum ? 'active' : ''}">
       	<a class="page-link" href="${pageNum}">${pageNum}</a>
       </li>
 </c:forEach>    
   <!-- 다음처리 -->
   <c:if test="${rpageMaker.next}">
     <li class="page-item">
       <a class="page-link" href="${rpageMaker.endPage+1}">▶</a>
     </li>
   </c:if> 
     </ul>
   </div>
   <!-- END -->
   <form id="pageFrm" action="${cPath}/board/getBoard" method="post">
      <!-- 게시물 번호(idx)추가 -->
      <input type="hidden" name="recipeId" value="<c:out value='${vo.recipeId}'/>"/>         
      <input type="hidden" name="page" value="<c:out value='${cri.page}'/>"/>
      <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>"/>
      <input type="hidden" name="type" value="<c:out value='${cri.type}'/>"/>
      <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"/>
      <input type="hidden" id="rpage" name="rpage" value="${rpageMaker.rcri.rpage}"/>
      <input type="hidden" name="rperPageNum" value="${rpageMaker.rcri.rperPageNum}"/>
   </form>
</div>

</body>
</html>