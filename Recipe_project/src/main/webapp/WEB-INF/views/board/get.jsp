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
  <script>
  	let cPath = "${cPath}";
  </script>
  <script src="${cPath}/resources/js/board/get.js"></script>
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
          <%@ include file="../hiddenFields.jspf" %>
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
            <%@ include file="../hiddenFields.jspf" %>
	  		<input type="hidden" name="rpage" value="<c:out value='${rcri.rpage}'/>"/>
            <input type="hidden" name="rperPageNum" value="<c:out value='${rcri.rperPageNum}'/>"/>
	  	</div>
  	</form>
  </div>
  <div class="list-group list-group-flush">
  	  <h1>댓글 ${totalReview}개</h1>
      <c:forEach var="value" items="${list}">
      	<c:choose>
      		<c:when test="${value.viewAvailable eq 0}">
		      <div class="list-group-item d-flex flex-column mb-3">
		        <div class="d-flex flex-row align-items-center">
		          <p class="mb-1 flex-grow-1 text-start text-muted">삭제된 댓글입니다</p>
		        </div>
		      </div>
		    </c:when>
		    <c:otherwise>
		        <div class="list-group-item d-flex flex-column mb-3">
		          <div class="d-flex flex-row align-items-center">
		          	  <c:if test="${value.boardLevel>0}">
		                <c:forEach begin="1" end="${value.boardLevel}">
		                  <span style="padding-left: 20px"></span>
		                </c:forEach>            
		              </c:if>
			          <h6 class="mb-1 me-3">
			          	<c:if test="${value.profile eq ''}">
			          		<img src="${cPath}/resources/image/person.png" alt="프로필 사진" class="rounded-circle" width="20" height="20">
			          	</c:if>
			          	<c:if test="${value.profile ne ''}">
			          		<img src="${cPath}/resources/upload/${value.profile}" alt="프로필 사진" class="rounded-circle" width="20" height="20">
			          	</c:if>
			          	${value.viewWriter}
			          </h6>
			          <p class="mb-1 flex-grow-1 text-start"><c:out value="${value.comment}"/></p>
			          <small class="text-muted">${value.createComment}</small>
			          <c:if test="${mvo.nick eq value.viewWriter and value.viewAvailable ne 0}">
			          	<span class="btn-group">
					    	<button type="button" class="btn btn-link p-0 ms-1" data-btn="update" data-id="${value.reviewId}">수정</button>
					    	<button type="button" class="btn btn-link p-0 ms-1" data-btn="delete" data-id="${value.reviewId}">삭제</button>
					  	</span>
			          </c:if>
		          </div>
		          <c:if test="${!empty mvo}">
			          <div class="mt-2">
			          	<c:forEach begin="1" end="${value.boardLevel}">
		                  <span style="padding-left: 20px"></span>
		                </c:forEach>
					    <button type="button" class="btn btn-link p-0 text-decoration-none text-black" data-btn="subReply" data-id="${value.reviewId}">
					      대댓글 ▼
					    </button>
					  </div>
				  </c:if>
				  <!-- 댓글 수정 버튼 toggle -->
		          <form class="mt-3 d-none" id="updateForm-${value.reviewId}" action="${cPath}/review/update" method="post">
		          	  <input type="hidden" id="reviewId-${value.reviewId}" name="reviewId" value="${value.reviewId}">
			          <div class="row mb-2">
			              <textarea class="form-control" name="comment" rows="3">${value.comment}</textarea>
			          </div>
			          <div class="text-end">
			              <button type="button" class="btn btn-primary btn-sm" data-btn="updateReview">수정</button>
			          </div>
			          <%@ include file="../hiddenFields.jspf" %>
			      </form>
			      <!-- 대댓글 버튼 toggle -->
			      <form class="mt-3 d-none" id="replyForm-${value.reviewId}" action="${cPath}/review/insert" method="post">
		          	  <input type="hidden" id="parentId-${value.reviewId}" name="reviewId" value="${value.reviewId}">
		          	  <div class="mb-2">
		          	  	<c:if test="${mvo.profile eq ''}">
		        			<img src="${cPath}/resources/image/person.png" alt="프로필 사진" class="rounded-circle me-3" width="20" height="20">
		        		</c:if>
		        		<c:if test="${mvo.profile ne ''}">
		        			<img src="${cPath}/resources/upload/${mvo.profile}" alt="프로필 사진" class="rounded-circle me-3" width="20" height="20">
		        		</c:if>
		        		${mvo.nick}
			          </div>
			          <div class="row mb-2">
			              <textarea class="form-control" name="comment" rows="3"></textarea>
			          </div>
			          <div class="text-end">
			              <button type="button" class="btn btn-primary btn-sm" data-btn="insertReview">답글</button>
			          </div>
			          <input type="hidden" name="viewWriter" value="<c:out value='${mvo.nick}'/>"/>
		              <%@ include file="../hiddenFields.jspf" %>
			  		  <input type="hidden" name="rpage" value="<c:out value='${rcri.rpage}'/>"/>
		              <input type="hidden" name="rperPageNum" value="<c:out value='${rcri.rperPageNum}'/>"/>
			      </form>  
		        </div>
	        </c:otherwise>
        </c:choose>
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
      <%@ include file="../hiddenFields.jspf" %>
      <input type="hidden" id="rpage" name="rpage" value="${rpageMaker.rcri.rpage}"/>
      <input type="hidden" name="rperPageNum" value="${rpageMaker.rcri.rperPageNum}"/>
   </form>
</div>
<!-- 삭제 확인 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="deleteForm" method="post" action="${cPath}/review/delete">
      	<%@ include file="../hiddenFields.jspf" %>
        <input type="hidden" name="reviewId" id="deleteReviewId">
        <input type="hidden" id="rpage" name="rpage" value="${rpageMaker.rcri.rpage}"/>
      	<input type="hidden" name="rperPageNum" value="${rpageMaker.rcri.rperPageNum}"/>
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">댓글 삭제</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
        </div>
        <div class="modal-body">
          정말 삭제하시겠습니까?
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-sm">예</button>
          <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">아니오</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>