<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 사이트</title>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${cPath}/resources/css/swiper.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
    let msgType = "${msgType}";
</script>
<script src="${cPath}/resources/js/main/modal.js"></script>
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
	                <a class="nav-link" href="#">문의사항</a>
	            </li>
        	</ul>
		</div>
	</nav>
	
	<section>
	<!-- Swiper -->
	  <div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide">
	      	<img alt="메인이미지1" src="${cPath}/resources/image/dish1.png">
	      </div>
	      <div class="swiper-slide">
	      	<img alt="메인이미지2" src="${cPath}/resources/image/dish2.png">
	      </div>
	      <div class="swiper-slide">
	      	<img alt="메인이미지3" src="${cPath}/resources/image/dish3.png">
	      </div>
	    </div>
	    <div class="swiper-button-next"></div>
	    <div class="swiper-button-prev"></div>
	    <div class="swiper-pagination"></div>
	  </div>
	</section>
	
	<section id="lead">
		<h3>대표음식</h3>
		<div id="lead_image">
			<div id="lead_image1">
				<a href="#">한식</a>
			</div>
			<div id="lead_image2">
				<a href="#">중식</a>
			</div>
			<div id="lead_image3">
				<a href="#">양식</a>
			</div>
		</div>
	</section>
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
<script src="${cPath}/resources/js/main/swiper.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>