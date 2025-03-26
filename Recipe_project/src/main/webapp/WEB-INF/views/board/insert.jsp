<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록</title>
<jsp:include page="../main/header.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-3">
	  <h2>레시피 등록</h2>
	  <div class="card">
	    <div class="card-header">레시피 등록</div>
	    <div class="card-body">
	    	<form action="${cPath}/board/insert" method="post">
	          <input type="hidden" name="userId" value="${mvo.userId}"/>
	          <!-- <div class="form-group">
	             <label>카테고리</label>
	             <select name="cateId">
	             	<option value="1">한식</option>
	             	<option value="2">양식</option>
	             	<option value="3">중식</option>
	             </select>
	          </div> -->
	          <div class="form-group">
	             <label>제목</label>
	             <input type="text" name="title" class="form-control">
	          </div>
	          <div class="form-group">
	             <label>내용</label>
	             <textarea rows="10" name="content" class="form-control"></textarea>
	          </div>
	          <div class="form-group">
	             <label>작성자</label>
	             <input type="text" name="writer" class="form-control" value="${mvo.nick}" readonly="readonly">
	          </div>
	          <button type="submit" class="btn btn-sm btn-primary">등록</button>
	          <button type="reset" class="btn btn-sm btn-secondary">취소</button>
	       </form>
	    </div> 
	    
	  </div>
	</div>
</body>
</html>