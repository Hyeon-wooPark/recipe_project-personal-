<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="../main/header.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cPath}/resources/css/join.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<script type="text/javascript">
	$(document).ready(() => {
		$("#domainSelect").on("change", function () {
			let selected = $(this).val();
			if(selected) {
				$("#domain").val(selected).prop("readonly", true);
			} else {
				$("#domain").val('').prop("readonly", false);
			}
		});
		
		$("#numInput1").on("input", function(){
	        if ($(this).val().length > 6) {
	            $(this).val($(this).val().slice(0, 6));
	        }
	    });
		
		$("#numInput2").on("input", function(){
	        if ($(this).val().length > 1) {
	            $(this).val($(this).val().slice(0, 1));
	        }
	    });
		
		$("#numInput3").on("input", function() {
			if ($(this).val().length > 11) {
				$(this).val($(this).val().slice(0, 11));
			}
		})
		
		$("#togglePassword1").on("click", function() {
	        let passwordInput = $("#passwd1"); 
	        let type = passwordInput.attr("type") === "password" ? "text" : "password"; 
	        passwordInput.attr("type", type); 

	        $(this).toggleClass("fa-eye fa-eye-slash");
	    });
		
		$("#togglePassword2").on("click", function() {
	        let passwordInput = $("#passwd2"); 
	        let type = passwordInput.attr("type") === "password" ? "text" : "password"; 
	        passwordInput.attr("type", type); 

	        $(this).toggleClass("fa-eye fa-eye-slash");
	    });
	});
	function doubleCheck() {
		let id = $("#id").val();
		$.ajax({
			url : "${cPath}/user/doubleCheck",
			type : "get",
			data : {"id" : id},
			success : function(result) {
				if(result == 1) {
					$("#checkMessage").text("사용할 수 있는 아이디입니다.");
  					$("#checkType").attr("class", "modal-content bg-success");
  					$("#checkButton").prop("disabled", true);
				} else {
					$("#checkMessage").text("사용할 수 없는 아이디입니다.");
  					$("#checkType").attr("class", "modal-content bg-warning");
				}
				$("#myModal").modal("show");
			}, error : function() {
				alert("error");
			}
		});
	}
	
	function abled() {
		$("#checkButton").prop("disabled", false);
	}
	function main() {
		location.href="<c:url value='/'/>"
	}
	
	function passCheck() {
		let passwd1 = $("#passwd1").val();
		let passwd2 = $("#passwd2").val();
		$("#check").css("display","block")
		
		if(passwd1 == passwd2) {
			$("#check").css("color", "blue");
			$("#check").text("일치");
		} else {
			$("#check").css("color", "red");
			$("#check").text("불일치");
		}
		if(passwd2 === "") {
			$("#check").css("display","none")
		}
	}
	
	function pass() {
		let passwd1 = $("#passwd1").val();
		let num = passwd1.search(/[0-9]/g);
		let eng = passwd1.search(/[a-z]/ig);
		let spe = passwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if(passwd1.length < 8 || passwd1.length > 20){
			$("#regular").css("display","block")
			$("#regular").css("color", "red");
			$("#regular").text("8자리 ~ 20자리 이내로 입력해주세요.");
		}else if(passwd1.search(/\s/) != -1){
			$("#regular").css("display","block")
			$("#regular").css("color", "red");
			$("#regular").text("비밀번호는 공백 없이 입력해주세요.");
		}else if(num < 0 || eng < 0 || spe < 0 ){
			$("#regular").css("display","block")
			$("#regular").css("color", "red");
			$("#regular").text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		}else {
			$("#regular").css("display","none")
		}
	}
	
	function doubleNick() {
		let nick = $("#nick").val();
		$.ajax({
			url : "${cPath}/user/nickCheck",
			type : "get",
			data : {"nick" : nick},
			success : function(result) {
				if(result == 1) {
					$("#checkMessage").text("사용할 수 있는 닉네임입니다.");
  					$("#checkType").attr("class", "modal-content bg-success");
  					$("#nickButton").prop("disabled", true);
				} else {
					$("#checkMessage").text("사용할 수 없는 닉네임입니다.");
  					$("#checkType").attr("class", "modal-content bg-warning");
				}
				$("#myModal").modal("show");
			}, error : function() {
				alert("error");
			}
		});
	}
	
	function nickable() {
		$("#nickButton").prop("disabled", false);
	}
	
	function join() {
		if(!$("#checkButton").prop("disabled")) {
			alert("아이디 중복확인을 해주세요.")
			$("#id").focus();
			return;
		}
		let passwd1 = $("#passwd1").val();
		let passwd2 = $("#passwd2").val();
		let num = passwd1.search(/[0-9]/g);
		let eng = passwd1.search(/[a-z]/ig);
		let spe = passwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if(passwd1.length < 8 || passwd1.length > 20){
			alert("8자리 ~ 20자리 이내로 입력해주세요.")
			$("#passwd1").focus();
		}else if(passwd1.search(/\s/) != -1){
			alert("비밀번호는 공백 없이 입력해주세요.")
			$("#passwd1").focus();
		}else if(num < 0 || eng < 0 || spe < 0 ){
			alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.")
			$("#passwd1").focus();
		}else if(passwd1 != passwd2) {
			alert("비밀번호가 일치하지 않습니다.")
			$("#passwd2").focus();
			return;
		}
		
		if($("#emailId").val() === null || $("#emailId").val().trim() === "") {
			alert("이메일 아이디가 비어있거나 공백을 포함하고 있습니다.")
			$("#emailId").focus();
			return;
		} else if($("#domain").val() === null || $("#domain").val().trim() === "") {
			alert("도메인을 입력해주세요.")
			$("#domain").focus();
			return;
		}
		
		if($("#name").val() === null || $("#name").val().trim() === "") {
			alert("이름이 비어있거나 공백을 포함하고 있습니다.")
			$("#name").focus();
			return;
		}
		
		if($("#nick").val() === null || $("#nick").val().trim() === "") {
			alert("닉네임이 비어있거나 공백을 포함하고 있습니다.")
			$("#nick").focus();
			return;
		} else if(!$("#nickButton").prop("disabled")) {
			alert("닉네임 중복확인을 해주세요.")
			$("#nick").focus();
			return;
		}
		
		let num1 = Number(String($("#numInput1").val()).slice(2, 4));
		let num2 = Number(String($("#numInput1").val()).slice(4, 6));
		if($("#numInput1").val().length !== 6 || num1 > 12 || num2 > 31) {
			alert("주민번호를 다시 입력해주세요.");
			$("#numInput1").focus();
			return;
		} else if($("#numInput2").val() > 4) {
			alert("주민번호 뒷자리를 다시 입력해주세요.")
			$("#numInput2").focus();
			return;
		}
		
		if($("#numInput3").val().length < 10) {
			alert("전화번호를 다시 입력해주세요.")
			$("#numInput3").focus();
			return;
		}
		
		document.frm.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col"></div>
		<div class="col">
			<div class="jumbotron" style="padding-top: 20px;">
				<form name="frm" method="post" action="${cPath}/user/join">
					<h1 style="text-align: center;">회원가입 화면</h1>
					
					<div class="input-group mb-3">
					  <input type="text" id="id" class="form-control" placeholder="아이디" name="userId" maxlength="20" onkeydown="abled()">
					  <button class="btn btn-primary" type="button" id="checkButton" onclick="doubleCheck()">중복확인</button>
					</div>
					  					
					<div class="form-group mb-3">
						<div class="input-group">
							<input type="password" class="form-control" placeholder="비밀번호" id="passwd1" name="passwd" maxlength="20" onkeyup="pass()">
							<span class="input-group-text">
								<i class="fa fa-eye fa-lg" id="togglePassword1" style="cursor: pointer;"></i>
							</span>
						</div>
					</div>
					
					<div>
						<p id="regular" style="display: none;"></p>
					</div>
					
					<div class="form-group mb-3">
						<div class="input-group">
							<input type="password" class="form-control" placeholder="비밀번호 확인" id="passwd2" maxlength="20" onkeyup="passCheck()">
							<span class="input-group-text">
								<i class="fa fa-eye fa-lg" id="togglePassword2" style="cursor: pointer;"></i>
							</span>
						</div>
					</div>
					
					<div>
						<p id="check" style="display: none;"></p>
					</div>
					
					<div class="form-group mb-3">
					    <div class="input-group d-flex" style="width: 100%; flex-wrap: nowrap;">
					        <input type="text" class="form-control" id="emailId" name="emailId" placeholder="아이디" style="flex: 8 1 0; min-width: 0;">
					        
					        <div class="input-group-append">
					            <span class="input-group-text" style="flex: 1 1 0; min-width: 0;">@</span>
					        </div>
					        
					        <input type="text" class="form-control" id="domain" name="domain" placeholder="도메인" style="flex: 1 1 0; min-width: 0;">
					        
					        <div class="input-group-append">
					            <select class="form-select" id="domainSelect" style="flex: 1 1 0; min-width: 0;">
					                <option value="">직접 입력</option>
					                <option value="naver.com">naver.com</option>
					                <option value="gmail.com">gmail.com</option>
					                <option value="hanmail.net">hanmail.net</option>
					                <option value="nate.com">nate.com</option>
					                <option value="kakao.com">kakao.com</option>
					            </select>
					        </div>
					    </div>
					</div>
					
					<div class="form-group mb-3 mt-3">
						<input type="text" class="form-control" placeholder="이름" id="name" name="userName" maxlength="20">
					</div>
					
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="닉네임" id="nick" name="nick" maxlength="20" onkeydown="nickable()">
						<button class="btn btn-primary" type="button" id="nickButton" onclick="doubleNick()">중복확인</button>
					</div>
					
					<div class="form-group mb-3">
					    <div class="input-group d-flex" style="flex-wrap: nowrap; width: 100%;">
					        <!-- 주민번호 앞자리 -->
					        <input type="number" class="form-control auto" id="numInput1" name="resident1" placeholder="주민번호 앞자리" style="flex: 1 1 0; min-width: 0;">
					        
					        <!-- '-' 기호 -->
					        <span class="input-group-text" style="flex: 0 1 auto;">-</span>
					        
					        <!-- 주민번호 뒷자리 -->
					        <input type="number" class="form-control auto" id="numInput2" name="resident2" maxlength="1" placeholder="주민번호 뒷자리"
					               style="flex: 1 1 0; min-width: 0;" autocomplete="off">
					        <span class="input-group-text">●●●●●●</span>
					    </div>
					</div>
					
					<div class="form-group mb-3">
						<input type="number" class="form-control auto" placeholder="전화번호" id="numInput3" name="phone1">
					</div>
					
					<div class="d-flex gap-2">
					    <button type="button" class="btn btn-primary flex-fill" onclick="join()">회원가입</button>
					    <button type="reset" class="btn btn-danger flex-fill">초기화</button>
					    <button type="button" class="btn btn-secondary flex-fill" onclick="main()">메인화면</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 다이얼로그(모달창) -->
	    <!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog" tabindex="-1" aria-hidden="true">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div id="checkType" class="modal-content">
		      <div class="modal-header">
		      	<h4 class="modal-title">메세지 확인</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		      <div class="modal-body">
		        <p id="checkMessage"></p>
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