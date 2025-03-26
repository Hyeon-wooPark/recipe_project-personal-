<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${cPath}/resources/css/footer.css">
</head>
<body>
	<footer>
		<div id="footer_0">
			<div id="footer_1">
				<h4>오늘의 식단</h4>
				<p><img src="${cPath}/resources/image/logo.png"></p>
			</div>
			<div id="footer_2">
				<p id="footer_2_1">고객상담</p>
				<p id="footer_2_2">010-0000-0000</p>
				<p>상담메일 aa@today.co.kr<br>
					웹마스터 webmaster@today.co.kr
				</p>
			</div>
			<div id="footer_3">
				대전광역시 동구 우암로 352-21 (우) 34503<br>
				사업자등록번호 : 315-81-00000 | 대표전화 : 042-0000-0000<br>
				2023 © today's recipe Co.LTD All right Reserved.
			</div>
		</div>
	</footer>
</body>
</html>