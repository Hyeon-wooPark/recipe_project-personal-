<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 확인</title>
<jsp:include page="../main/header.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(() => {
		if(${empty mvo}) {
			alert("잘못된 접근입니다.")
			location.href="<c:url value='/'/>"
		}
	})
	
	function main() {
		location.href="<c:url value='/'/>"
	}
	
	
</script>
</head>
<body>
	<div class="container mt-5 p-4 border rounded shadow-lg bg-light">
    	<h1 class="text-center mb-4">사용자 정보</h1>
    
	    <div class="mb-4 d-flex justify-content-center align-items-center">
	        <span class="fw-bold fs-5 me-3">아이디:</span>
	        <span class="fs-5">${user.userId}</span>
	    </div>
	
	    <div class="mb-4 d-flex justify-content-center align-items-center">
	        <span class="fw-bold fs-5 me-3">이메일:</span>
	        <span class="fs-5">${user.email}</span>
	    </div>
	
	    <div class="mb-4 d-flex justify-content-center align-items-center">
	        <span class="fw-bold fs-5 me-3">이름:</span>
	        <span class="fs-5">${user.userName}</span>
	    </div>
	    
	    <div class="mb-4 d-flex justify-content-center align-items-center">
	        <span class="fw-bold fs-5 me-3">닉네임:</span>
	        <span class="fs-5">${user.nick}</span>
	    </div>
	    
	    <div class="mb-4 d-flex justify-content-center align-items-center">
	        <span class="fw-bold fs-5 me-3">전화번호:</span>
	        <span class="fs-5">${user.phone}</span>
	    </div>
	    
	    <div class="d-flex gap-4 justify-content-center mt-4">
	    	<c:if test="${mvo.userId eq user.userId}">
	    		<a href="${cPath}/user/deleteUser?userId=${mvo.userId}" class="btn btn-danger px-4 py-2" style="color:white; font-size-adjust: inherit;">회원탈퇴</a>
	    	</c:if>
	    	<a href="${cPath}/" class="btn btn-secondary px-4 py-2" style="color:white; font-size-adjust: inherit;">메인화면</a>
	    </div>
	</div>

</body>
</html>