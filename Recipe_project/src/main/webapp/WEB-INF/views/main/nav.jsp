<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<div class="container">
			<ul id="nav5" class="nav justify-content-around bg-light">
	            <li class="nav-item">
	                <a class="nav-link active" href="${cPath}/">Home</a>
	            </li>
	            <li class="nav-item">
	                <a class="nav-link" href="${cPath}/brand">brand</a>
	            </li>
	            <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">카테고리</a>
		          <ul class="dropdown-menu">
		          	<li><a class="dropdown-item" href="${cPath}/board/list">전체</a></li>
		            <li><a class="dropdown-item" href="#">한식</a></li>
		            <li><a class="dropdown-item" href="#">중식</a></li>
		            <li><a class="dropdown-item" href="#">양식</a></li>
		          </ul>
		        </li>
	            <li class="nav-item">
	                <a class="nav-link" href="${cPath}/query/list">문의사항</a>
	            </li>
        	</ul>
		</div>
	</nav>
</body>
</html>