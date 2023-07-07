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
				<div class="card-header"><strong>${param.id }</strong> 직종의 직원목록</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th style="width: 15%;">직원번호</th>
								<th style="width: 25%;">직원이름</th>
								<th style="width: 20%;">입사일</th>
								<th style="width: 25%;">부서명</th>
								<th class="text-end" style="width: 15%;">급여</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty emps }">
									<tr>
										<td class="text-center" colspan="5">해당 직종이 종사하는 직원을 찾을 수 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="emp" items="${emps }">
										<tr>
											<td>${emp.id}</td>
											<td>${emp.firstName } ${emp.lastName }</td>
											<td><fmt:formatDate value="${emp.hireDate }" pattern="yyyy년 MM월 d일" /></td>
											<td>${emp.department.name }</td>
											<td class="text-end">$<fmt:formatNumber value="${emp.salary }"/></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>