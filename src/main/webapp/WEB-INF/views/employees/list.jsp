<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<c:set var="menu" value="직원" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
				직원목록
				<a href="add" class="btn btn-primary btn-sm float-end">신규 직원 등록</a>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>입사일</th>
								<th>직종</th>
								<th>소속부서</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>100</td>
								<td>Steven King</td>
								<td>2005년 8월 10일</td>
								<td>AD_PRESS</td>
								<td>Executive</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>