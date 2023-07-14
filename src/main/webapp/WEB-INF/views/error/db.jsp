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
<c:set var="menu" value="홈" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mt-3">
		<div class="col-12">
			<div class="bg-light border p-3">
				<h1 class="mb-5">데이터베이스 오류</h1>
				<p>데이터베이스 작업 중 오류가 발생하였습니다.</p>
				<p>잠시 후 다시 시도해보시기 바랍니다.</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>