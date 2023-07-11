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
					<div class="d-flex justify-content-start mb-3">
						<select class="form-select me-3" style="width: 150px" name="sort" onchange="changeSort()">
							<option value="id" ${param.sort eq 'id' ? 'selected' : '' }> 아이디 순</option>
							<option value="name" ${param.sort eq 'name' ? 'selected' : '' }> 이름 순</option>
							<option value="date" ${param.sort eq 'date' ? 'selected' : '' }> 입사일 순</option>
							<option value="job" ${param.sort eq 'job' ? 'selected' : '' }> 직종 순</option>
							<option value="dept" ${param.sort eq 'dept' ? 'selected' : '' }> 소속부서명 순</option>
						</select>
						<select class="form-select" style="width: 150px" name="rows" onchange="changeRows()">
							<option value="10" ${param.rows eq 10 ? 'selected' : '' }> 10개씩</option>
							<option value="20" ${param.rows eq 20 ? 'selected' : '' }> 20개씩</option>
							<option value="50" ${param.rows eq 50 ? 'selected' : '' }> 50개씩</option>
						</select>
					</div>
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
							<c:choose>
								<c:when test="${not empty result.employees }">
									<c:forEach var="emp" items="${result.employees}">
									<tr>
										<td>${emp.id }</td>
										<td>${emp.firstName } ${emp.lastName }</td>
										<td><fmt:formatDate value="${emp.hireDate }" pattern="yyyy년 M월 d일" /> </td>
										<td>${emp.job.id }</td>
										<td>${emp.department.name }</td>
									</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center">검색결과가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<c:if test="${result.pagination.totalRows gt 0}">
						<c:set var="currentPage" value="${result.pagination.page }"/>
						<c:set var="first" value="${result.pagination.first }" />
						<c:set var="last" value="${result.pagination.last }"></c:set>
						<c:set var="prePage" value="${result.pagination.prePage }"></c:set>
						<c:set var="nextPage" value="${result.pagination.nextPage }"></c:set>
						<c:set var="beginPage" value="${result.pagination.beginPage }"></c:set>
						<c:set var="endPage" value="${result.pagination.endPage }"></c:set>
						<nav>
							<ul class="pagination justify-content-center">
								<li class="page-item ${first ? 'disabled' : ''}">
									<a href="list?page=${prePage }" class="page-link" onclick="changePage(event, ${prePage})">이전</a>
								</li>
								<c:forEach var="num" begin="${beginPage }" end="${endPage }">
									<li class="page-item ${currentPage eq num ? 'active' : '' }">
										<!-- a태그의 원래 기능인 이동이 일어나지 않게 하기 위해 event의 preventEvent를 
									         사용할 것 -->
										<a href="" class="page-link" onclick="changePage(event,${num})">${num }</a>
									</li>
								</c:forEach>
								<li class="page-item ${last ? 'disabled' : ''}">
									<a href="list?page=${nextPage }" class="page-link" onclick="changePage(event, ${nextPage})">다음</a>
								</li>
							</ul>
						</nav>
					</c:if>
					<div class="d-flex justify-content-center">
						<!-- 
							form안에 hidden으로 숨기거나(그냥 잉여form을 만들 수 있다.), form을 넓게 잡는다.  
							어떤걸 클릭해도 검색에 영향을 미치는 모든것이 제출되어야함
							-->
						<form id="form-employee-search" class="row row-cols-md-auto g-3 align-items-center"
							method="get" action="list">
							<input type="hidden" name="sort" value="${param.sort }" />
							<input type="hidden" name="rows" value="${param.rows }" />
							<input type="hidden" name="page" value="${param.page }" />
							<div class="col-12">
								<select class="form-select" name="opt">
									<option value="name" ${param.opt eq 'name' ? 'selected' : '' }> 이름</option>
									<option value="job" ${param.opt eq 'job' ? 'selected' : '' }> 직종</option>
									<option value="phone" ${param.opt eq 'phone' ? 'selected' : '' }> 연락처</option>
									<option value="dept" ${param.opt eq 'dept' ? 'selected' : '' }> 부서명</option>
								</select>
							</div>
							<div class="col-12">
								<input type="text" class="form-control" name="keyword" value="${param.keyword }">
							</div>
							<div class="col-12">
								<button type="button" class="btn btn-outline-secondary btn sm" onclick="searchEmployee()">검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function changeSort(){
		let sort = document.querySelector("select[name=sort]").value;
		document.querySelector("input[name=sort]").value = sort;
		document.querySelector("input[name=page]").value = 1;
		
		document.querySelector("#form-employee-search").submit();
	}
	
	function changeRows(){
		let rows = document.querySelector("select[name=rows]").value;
		document.querySelector("input[name=rows]").value = rows;
		document.querySelector("input[name=page]").value = 1;
		
		document.querySelector("#form-employee-search").submit();
	}
	
	function changePage(event, page){
		event.preventDefault();
		document.querySelector("input[name=page]").value = page;

		document.querySelector("#form-employee-search").submit();
	}
	
	function searchEmployee(){
		
		let keyword = document.querySelector("input[name=keyword]").value;
		if(keyword.trim() === ""){
			alert("키워드를 입력하세욧!")			
			document.querySelector("input[name=page]").value = 1;
			return
		}
		
		document.querySelector("input[name=page]").value = 1;
		
		document.querySelector("#form-employee-search").submit();
	}
</script>
</body>
</html>