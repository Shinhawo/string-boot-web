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
<c:set var="menu" value="직종"/>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					직종 목록
					<a href="add" class="btn btn-primary btn-sm float-end">새 직종등록</a>
				</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th style="width: 20%">아이디</th>
								<th style="width: 20%">제목</th>
								<th class="text-end" style="width: 20%">최저급여</th>
								<th class="text-end" style="width: 20%">최대급여</th>
								<th class="text-end" style="width: 20%"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="job" items="${jobs }">
								<tr>
									<td>${job.id }</td>
									<td>${job.title }</td>
									<td class="text-end">$<fmt:formatNumber value="${job.minSalary }"/></td>
									<td class="text-end">$<fmt:formatNumber value="${job.maxSalary }" /></td>
									<td class="text-end"><a href="emps?id=${job.id }" class="btn btn-outline-primary btn-sm">직원보기</a></td>
								</tr>
							</c:forEach>
		
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>