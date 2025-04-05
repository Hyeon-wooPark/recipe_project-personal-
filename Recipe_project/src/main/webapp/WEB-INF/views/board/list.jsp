<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>레시피 게시판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <jsp:include page="../main/header.jsp"></jsp:include>
  <script type="text/javascript">
     $(document).ready(function(){
    	$("#regBtn").click(function(){
    		location.href="${cPath}/board/insert";
    	});
    	
    	//페이지 번호 클릭시 이동 하기
    	var pageFrm=$("#pageFrm");
    	$(".page-item a").on("click", function(e){
    		e.preventDefault(); // a tag의 기능을 막는 부분
    		var page=$(this).attr("href"); // 페이지번호
    		pageFrm.find("#page").val(page);
    		pageFrm.submit();    		
    	});    	
    	// 상세보기 클릭시 이동 하기
    	$(".move").on("click", function(e){
    		e.preventDefault(); // a tag의 기능을 막는 부분
    		let recipeId=$(this).attr("href");
    		let tag="<input type='hidden' name='recipeId' value='"+recipeId+"'/>";
    		pageFrm.append(tag);
    		pageFrm.attr("action","${cPath}/board/getBoard");
    		pageFrm.attr("method","get");
    		pageFrm.submit();
    	});
    	
     });
  </script>
</head>
<body>
 
<div class="container mt-3">
  
  <h1>레시피 게시판</h1>
  <div class="card">
    <div class="card-body">
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
          </tr>
        </thead>
        
        <c:forEach var="vo" items="${list}">
          <tr>
            <td>${vo.recipeId}</td>
            
           	<td>
            	<a class="move" href="${vo.recipeId}">
            		<c:out value='${vo.title}'/>
            	</a>
            </td>
                    
            <c:if test="${vo.profile eq ''}">
	        	<td><img src="${cPath}/resources/image/person.png" alt="프로필 사진" class="rounded-circle me-3" width="30" height="30">${vo.writer}</td>
	        </c:if>
            <c:if test="${vo.profile ne ''}">
            	<td><img src="${cPath}/resources/upload/${vo.profile}" alt="프로필 사진" class="rounded-circle me-3" width="30" height="30">${vo.writer}</td>
            </c:if>
            <c:if test="${vo.createDate eq vo.updateDate}">
            	<td>${vo.createDate}</td>
            </c:if>
            <c:if test="${vo.createDate ne vo.updateDate}">
            	<td>${vo.updateDate}</td>
            </c:if>
            <td>${vo.count}</td>
          </tr>
        </c:forEach>
        
        <c:if test="${!empty mvo}"> 
	        <tr>
	          <td colspan="5" class="text-end">
	            <button id="regBtn" style="font-weight: bold;" class="btn btn-sm btn-info">글쓰기</button>            
	          </td>
	        </tr>
        </c:if>
      </table>
      <!-- 검색메뉴 -->
      <div class="d-flex justify-content-center mb-3">
	      <form class="d-flex align-items-center gap-2" action="${cPath}/board/list" method="post">
	      	  <div>
				<select name="type" class="form-select">
					<option value="writer" ${pageMaker.cri.type=='writer' ? 'selected' : ''}>이름</option>
					<option value="title" ${pageMaker.cri.type=='title' ? 'selected' : ''}>제목</option>
					<option value="content" ${pageMaker.cri.type=='content' ? 'selected' : ''}>내용</option>
				</select>
			  </div>
			  <div>
			    <input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
			  </div>
			  <button type="submit" class="btn btn-secondary">검색</button>
		  </form>
	  </div>
      <!-- 페이징 START -->
      <div class="d-flex justify-content-center">
	    <ul class="pagination">
      <!-- 이전처리 -->
      <c:if test="${pageMaker.prev}">
        <li class="page-item">
          <a class="page-link" href="${pageMaker.startPage-1}">◀</a>
        </li>
      </c:if>      
      <!-- 페이지번호 처리 -->
          <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	         <li class="page-item ${pageMaker.cri.page==pageNum ? 'active' : ''}">
	         	<a class="page-link" href="${pageNum}">${pageNum}</a>
	         </li>
		  </c:forEach>    
      <!-- 다음처리 -->
      <c:if test="${pageMaker.next}">
        <li class="page-item">
          <a class="page-link" href="${pageMaker.endPage+1}">▶</a>
        </li>
      </c:if> 
        </ul>
      </div>
      <!-- END -->
      <form id="pageFrm" action="${cPath}/board/list" method="post">
         <input type="hidden" id="page" name="page" value="${pageMaker.cri.page}"/>
         <input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
         <input type="hidden" name="type" value="${pageMaker.cri.type}">
         <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
      </form>      
      
    </div>
  </div>
</div>

</body>
</html>