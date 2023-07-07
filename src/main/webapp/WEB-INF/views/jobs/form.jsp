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
<c:set var="menu" value="직종" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">새 직종 등록폼</div>
				<div class="card-body">
					<form method="post" action="add">
						<div class="form-group mb-2">
							<label class="form-label">직종 아이디</label>
							<input type="text" class="form-control" name="id">
						</div>
						<div class="form-group mb-2">
							<label class="form-label">직종 제목</label>
							<input type="text" class="form-control" name="title">
						</div>
						<div class="form-group mb-2">
							<label class="form-label">최소 급여</label>
							<input type="text" class="form-control" name="minSalary">
						</div>
						<div class="form-group mb-2">
							<label class="form-label">최대 급여</label>
							<input type="text" class="form-control" name="maxSalary">
						</div>
						<div class="text-end">
							<a href="list" class="btn btn-secondary">취소</a>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>