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
<c:set var="menu" value="직원"/>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
 	<div class="row mb-3">
 		<div class="col-12">
 			<div class="card">
 				<div class="card-header">일괄 등록 파일 관리</div>
 				<div class="card-body">
 					<table class="table">
 						<thead>
 							<tr>
 								<th>아이디</th>
 								<th>제목</th>
 								<th>파일명</th>
 								<th>등록여부</th>
 								<th></th>
 							</tr>
 						</thead>
 						<tbody>
 							<c:forEach var="file" items="${files }">
 								<tr class="align-middle">
 									<td>${file.id }</td>
 									<td>${file.title }</td>
 									<td>${file.name }</td>
 									<td>${file.added eq 'N' ? '미등록' : '등록완료' }</td>
 									<td>
 										<a href="add-all?id=${file.id }" class="btn btn-primary btn-sm">일괄등록</a>
 										<a href="download?id=${file.id }" class="btn btn-outline-primary btn-sm">다운로드</a>
 									</td>
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