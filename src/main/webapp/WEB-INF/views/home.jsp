<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>애플리케이션</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<%--
	<c:set var="이름" value="값" />
		현재 JSP의 PageContext객체의 속성에 지정된 이름으로 값을 저장한다.
 --%>
<c:set var="menu" value="홈" />
<%@include file="common/navbar.jsp"  %>
<div class="container">
  	<div class="row">
  		<div class="col-12">
  			<div class="bg-light p-3">
	  			<h1 class="fs-3">인사관리 애플리케이션</h1>
	  			<p>부서관리, 직원관리, 직종관리 기능을 제공합니다.</p>
  			</div>
  		</div>
  	</div>
</div>
</body>
</html>