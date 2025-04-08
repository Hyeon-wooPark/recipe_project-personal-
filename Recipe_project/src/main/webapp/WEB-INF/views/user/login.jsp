<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<jsp:include page="../main/header.jsp" ></jsp:include>
	<script>
	    let msgType = "${msgType}";
	</script>
	<script src="${cPath}/resources/js/main/modal.js"></script>
</head>
<body>
<section class="h-100 gradient-form">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="${cPath}/resources/image/logo.png"
                    style="width: 100px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">로그인</h4>
                </div>

                <form method="post" id="login_form" action="${cPath}/user/login">
                  <div class="mb-3">
	                  <label class="form-label fw-bold" for="userId">아이디</label>
	                  <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디" />
                  </div>
                  
                  <div class="mb-3">
	                  <label class="form-label fw-bold" for="passwd">비밀번호</label>
	                  <div class="input-group">
	                    <input type="password" name="passwd" id="passwd" class="form-control" placeholder="비밀번호" />
	                    <span class="input-group-text">
							<i class="fa fa-eye fa-lg" id="togglePassword" style="cursor: pointer;"></i>
						</span>
	                  </div>
                  </div>
                  
                  <div class="text-center pt-1 mb-5 pb-1">
                    <button type="submit" class="btn btn-danger btn-block fa-lg mb-3">로그인</button>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">아직도 회원이 아니신가요?</p>
                    <a href="${cPath}/user/join"><button type="button" class="btn btn-outline-danger">회원가입</button></a>
                  </div>

                </form>

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center" style="background-color: #1c1b1b; font-weight : bold; font-size: 24px">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h4 class="mb-4">환영합니다.</h4>
                <p class="small mb-0" style="font-weight: normal;">저희 사이트에 방문해 주셔서 감사합니다.<br> 저희 사이트는 회원제로 운영하는 곳입니다.<br> 회원가입을 하시지 않았다면 회원가입을 해주시기 바랍니다.<br> 행복한 하루가 되시길 바랍니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
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
<jsp:include page="../main/footer.jsp"></jsp:include>
<script src="${cPath}/resources/js/user/login.js"></script>
</body>
</html>