<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<c:set var="menu" value="부서" />
<%@include file="../common/navbar.jsp"  %>
<div class="container">
 	<div class="row mb-3">
 		<div class="col-3">
			<div class="card">
				<div class="card-header">부서 목록</div>
				<div class="card-body">
					<ul class="list-group overflow-auto" style="max-height: 500px">
						<c:forEach var="dept" items="${depts }">
							<li class="list-group-item">${dept.name }</li>
						</c:forEach>
					</ul>
				</div>
			</div>
 		</div>
 	</div>
</div>
</body>
</html>