<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>문의사항</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <jsp:include page="../main/header.jsp"></jsp:include>
  <script>
	let cPath = "${cPath}";
  </script>
  <script src="${cPath}/resources/js/query/queryList.js"></script>
</head>
<body>
	<div class="container mt-3">
		<h1>문의 게시판</h1>
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
			        <c:if test="${empty list}">
			        	<tr>
			        		<td colspan="5">등록된 게시글이 없습니다.</td>
			        	</tr>
			        </c:if>
			        <c:if test="${!empty list}">
				        <c:forEach var="vo" items="${list}">
				          <tr>
				            <td>${vo.queryId}</td>
				           	<td>
				            	<a class="move" href="#collapse${vo.queryId}" data-bs-toggle="collapse" data-id="${vo.queryId}" role="button" aria-expanded="false" aria-controls="collapse${vo.queryId}">
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
				            <td id="count${vo.queryId}">${vo.count}</td>
				          </tr>
				          <tr class="collapse" id="collapse${vo.queryId}">
				          	<td>내용</td>
				          	<td colspan="4">
				          		<textarea id="content${vo.queryId}" rows="4" class="form-control" readonly="readonly"></textarea>
				          	</td>
				          </tr>
				        </c:forEach>
			        </c:if>
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
				      <form class="d-flex align-items-center gap-2" action="${cPath}/query/list" method="post">
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
			      <form id="pageFrm" action="${cPath}/query/list" method="post">
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