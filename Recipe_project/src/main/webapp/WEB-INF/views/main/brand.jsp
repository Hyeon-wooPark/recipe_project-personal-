<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${cPath}/resources/css/reset.css">
<link rel="stylesheet" href="${cPath}/resources/css/brand.css">
</head>
<body>
	<section>
		<h1>브랜드 소개</h1>
		<div>
			<p>저희 사이트를 방문해 주셔서 감사합니다.<br>
			사이트를 방문해주시는 고객들을 위해서 언제나 쉽게 따라할 수 있고, 가족들과 함께 즐기실 수 있는 맛있는 레시피를 연구해서 올려드립니다.<br>
			그러기에 연구기간이 있어 자주는 못올리지만 열심히 하는 브랜드가 되기 위해서 노력하겠습니다.<br>
			언제나 저희가 만든 레시피가 소비자들에게 힘이 되기위해 노력하겠습니다.<br>
			다시 한번 찾아주셔서 감사합니다.<br>
			추후에는 조리 도구나 재료들을 판매하는 매장도 오픈하겠습니다.
			</p>
			<div id="brand_image">
				<div id="brand1"></div><div id="brand2"></div><div id="brand3"></div>
			</div>
		</div>
	</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>