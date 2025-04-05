<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>오늘의 식단</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  	<link rel="shortcut icon" href="${cPath}/resources/favicon.ico">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
	<link href="https://fonts.cdnfonts.com/css/noto-sans-kr" rel="stylesheet">
	<link rel="stylesheet" href="${cPath}/resources/css/header.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			function updateTime() {
		      const now = new Date();
		      const timeStr = now.toLocaleTimeString(); 
		      $('#clock').text(timeStr); 
		    }

		    setInterval(updateTime, 1000);
		    updateTime();
		})
	</script>
</head>
<body>
	<header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      	<h1><img alt="로고" src="${cPath}/resources/image/logo.png"></h1>
      </div>
      <div class="col-4 text-center">
        <h1><a class="blog-header-logo text-dark" href="${cPath}/">오늘의 식단</a></h1>
      </div>
      
      <div class="col-4 d-flex justify-content-end align-items-center">
      	<c:if test="${empty mvo}">
      		<a class="btn btn-sm btn-outline-primary" href="${cPath}/user/login">로그인</a>
        	<a class="btn btn-sm btn-outline-secondary" href="${cPath}/user/join">회원가입</a>
        </c:if>
        <c:if test="${!empty mvo}">
        	<div class="d-flex align-items-center">
        		<c:if test="${mvo.profile eq ''}">
        			<img src="${cPath}/resources/image/person.png" alt="프로필 사진" class="rounded-circle me-3" width="50" height="50">
        		</c:if>
        		<c:if test="${mvo.profile ne ''}">
        			<img src="${cPath}/resources/upload/${mvo.profile}" alt="프로필 사진" class="rounded-circle me-3" width="50" height="50">
        		</c:if>
        		<br>
		        <h5 class="me-2 mb-0">${mvo.nick}님</h5>
		        <button type="button" class="btn dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
					<span class="visually-hidden"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="${cPath}/user/update">회원정보 수정</a></li>
				    <li><a class="dropdown-item" href="${cPath}/user/profile">프로필 사진 변경</a></li>
				    <li><a class="dropdown-item" href="${cPath}/user/inform?userId=${mvo.userId}">내 정보 보기</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="${cPath}/user/logout">로그아웃</a></li>
				</ul>
		    </div>      		
        </c:if>
      </div>
      
    </div>
    <div class="row">
      <div class="col text-center mt-2">
        <h2 class="fs-5 mb-0 fw-bold"><span id="clock"></span></h2>
      </div>
    </div>
  </header>
</body>
</html>