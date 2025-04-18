<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 변경</title>
<jsp:include page="../main/header.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cPath}/resources/css/join.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script>
	let cPath = "${cPath}";
	let isEmptyMvo = ${empty mvo};
	let msgType = "${msgType}";
</script>
<script src="${cPath}/resources/js/main/check.js"></script>
<script src="${cPath}/resources/js/main/modal.js"></script>
</head>
<body>
	<div class="container">
		<div class="col"></div>
		<div class="col">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="${cPath}/user/profile" enctype="multipart/form-data">
					<h1 style="text-align: center;">프로필 변경</h1>
					
					<input type="hidden" name="userId" value="${mvo.userId}">
					  					
					<table class="table table-bordered text-center">
		    			<tr>
		    				<td style="width: 110px; vertical-align: middle;">닉네임</td>
		    				<td>${mvo.nick}</td>
		    			</tr>
		    			<tr>
		    				<td style="width: 110px; vertical-align: middle;">사진업로드</td>
		    				<td style="display: grid; place-items: center; gap: 10px;">
		    					<c:if test="${mvo.profile eq ''}">
				        			<img src="${cPath}/resources/image/person.png" alt="프로필 사진" class="rounded-circle me-3" width="100" height="100">
				        		</c:if>
				        		<c:if test="${mvo.profile ne ''}">
				        			<img src="${cPath}/resources/upload/${mvo.profile}" alt="프로필 사진" class="rounded-circle me-3" width="100" height="100">
				        		</c:if>
				        		
							    <span class="btn btn-light">
		    						<input type="file" accept=".png, .jpg, .gif" name="file">
		    					</span>
		    				</td>
		    			</tr>
		    		</table>
					
					<div class="d-flex gap-2">
					    <button type="submit" class="btn btn-primary flex-fill">프로필 사진변경</button>
					    <button type="reset" class="btn btn-danger flex-fill">초기화</button>
					    <button type="button" class="btn btn-secondary flex-fill" onclick="location.href='<c:url value='/'/>'">메인화면</button>
					</div>
				</form>
			</div>
		</div>
	    <!-- Modal -->
		<div id="myMessage" class="modal fade" role="dialog" tabindex="-1">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div id="messageType" class="modal-header">
		      	<h4 class="modal-title">${msgType}</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		      <div class="modal-body">
		        <p>${msg}</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="col"></div>
	</div>
</body>
</html>