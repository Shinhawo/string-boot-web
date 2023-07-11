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
					<div class="list-group overflow-auto" id="dept-list" style="max-height: 500px">
						<c:forEach var="dept" items="${depts }">
							<!-- id는 고유한값이어야 함. html에서는 id가 숫자가되면 안된다고 합니다,,, 걍 원칙임^^ -->
							<a href="detail?id=${dept.id }" class="list-group-item list-group-item-action" id="dept-${dept.id }" onclick="getDeptDetail(event, ${dept.id})">${dept.name }</a>
						</c:forEach>
					</div>
				</div>
			</div>
 		</div>
 		<div class="col-9">
 			<div class="row mb-3">
 				<div class="col-12">
 					<div class="card">
 						<div class="card-header">부서 정보</div>
 						<div class="card-body">
 							<table class="table table-bordered">
 								<tbody>
 									<tr>
 										<th style="width: 15%">아이디</th>
 										<td style="width: 35%"><span id="dept-id"></span></td>
 										<th style="width: 15%">부서명</th>
 										<td style="width: 35%"><span id="dept-name"></span></td>
 									</tr>
 									<tr>
 										<th style="width: 15%">관리자</th>
 										<td style="width: 35%"><span id="manager-name"></span></td>
 										<th style="width: 15%">사원수</th>
 										<td style="width: 35%"><span id="emp-count"></span></td>
 									</tr>
 								</tbody>
 							</table>
 						</div>
 					</div>
 				</div>
 			</div>
 			<div class="row mb-3">
 				<div class="col-12">
 					<div class="card">
 						<div class="card-header">소속 사원 리스트</div>
 						<div class="card-body">
 							<table class="table" id="table-employees">
 								 <thead>
 									<tr>
 										<th>아이디</th>
 										<th>이름</th>
 										<th>직종</th>
 										<th >입사일</th>
 										<th>급여</th>
 										<th></th>
 									</tr>
 								</thead>
 								<tbody></tbody>
 							</table>
 						</div>
 					</div>
 				</div> 			
 			</div>
 		</div>
 	</div>
</div>
<div class="modal" tabindex="-1" id="modal-emp-info">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title">직원정보</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
           	<p>직원상세정보를 확인하세요.</p>
            <table class="table table-bordered" id="table-emp-detail">
               <tr>
                  <th style="width: 15%;">아이디</th>
                  <td style="width: 35%;" id="cell-emp-id"></td>
                  <th style="width: 15%;">이름</th>
                  <td style="width: 35%;" id="cell-emp-name"></td>
               </tr>
               <tr>
                  <th style="width: 15%;">이메일</th>
                  <td style="width: 35%;" id="cell-emp-email"></td>
                  <th style="width: 15%;">연락처</th>
                  <td style="width: 35%;" id="cell-emp-phone"></td>
               </tr>
               <tr>
                  <th style="width: 15%;">입사일</th>
                  <td style="width: 35%;" id="cell-emp-hiredate"></td>
                  <th style="width: 15%;">직종</th>
                  <td style="width: 35%;" id="cell-emp-job"></td>
               </tr>
               <tr>
                  <th style="width: 15%;">급여</th>
                  <td style="width: 35%;" id="cell-emp-salary"></td>
                  <th style="width: 15%;">커미션</th>
                  <td style="width: 35%;" id="cell-emp-comm"></td>
               </tr>
               <tr>
                  <th style="width: 15%;">관리자</th>
                  <td style="width: 35%;" id="cell-manager-name"></td>
                  <th style="width: 15%;">부서명</th>
                  <td style="width: 35%;" id="cell-dept-name"></td>
               </tr>
            </table>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>

<script type="text/javascript">
	// 부트스트랩의 모달객체 생성하기
	const empModal = new bootstrap.Modal('#modal-emp-info', {
		keyboard: false
	});
	
	// 모달 엘리먼트에 이벤트 핸들러 함수 등록하기
	let el = document.querySelector('#modal-emp-info');
	// hidden.bs.modal의 부트스트랩의 사용자정의 이벤트이다.
	// 모달창이 완전히 화면에서 보이지 않게 되었을 때 발생하는 이벤트다.
	// 이 이벤트를 사용하면 모달창이 닫혀질 때 특정 작업을 수행할 수 있다.
	// 이 이벤트를 사용해서 모달창에 표시했던 값을 초기화한다.
	el.addEventListener("hidden.bs.modal", function(){
		document.querySelector("#cell-emp-id").textContent = "";
		document.querySelector("#cell-emp-name").textContent = "";
		document.querySelector("#cell-emp-email").textContent = "";
		document.querySelector("#cell-emp-phone").textContent = "";
		document.querySelector("#cell-emp-hiredate").textContent = "";
		document.querySelector("#cell-emp-job").textContent = "";
		document.querySelector("#cell-emp-salary").textContent = "";
		document.querySelector("#cell-emp-comm").textContent = "";
		document.querySelector("#cell-manager-name").textContent = "";
		document.querySelector("#cell-dept-name").textContent = "";
	})
	
	// 직원목록에서 상세보기버튼을 클릴할 때 실행되는 이벤트핸들러 함수다.
	// 직원아이디를 전달받아서 ajax 방식으로 서버에 직원 상세정보 조회 요청을 보낸다.
	// 응답으로 제공받은 직원상세정보를 모달의 테이블에 표시하고, 모달창을 연다.
	function showEmployeeModal(empId) {
		
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200){
				let emp = JSON.parse(xhr.responseText);
				
				document.querySelector("#cell-emp-id").textContent = emp.id;
				document.querySelector("#cell-emp-name").textContent = emp.firstName +' ' + emp.lastName;
				document.querySelector("#cell-emp-email").textContent = emp.email;
				document.querySelector("#cell-emp-phone").textContent = emp.phoneNumber;
				document.querySelector("#cell-emp-hiredate").textContent = emp.hireDate.substr(0, 10);
				document.querySelector("#cell-emp-job").textContent = emp.job.title;
				document.querySelector("#cell-emp-salary").textContent = emp.salary;
				document.querySelector("#cell-emp-comm").textContent = emp.commissionPct || '';
				document.querySelector("#cell-manager-name").textContent = emp.manager ? emp.manager.firstName + ' ' + emp.manager.lastName : '';
				document.querySelector("#cell-dept-name").textContent = emp.department ? emp.department.name : '';

				empModal.show();
			}
		}
		xhr.open("get", "/emp/detail?id=" + empId);
		xhr.send();
		
	}
	
	
	
	// 부서정보 테이블의 값을 삭제한다.
	// textContent : 태그사이에 값을 넣어준다.
	// 아래의 경우에는 태그사이에 넣을 값을 ""(공백)으로 설정하여 부서정보 테이블의 값을 삭제하였다.
	function clearDeptInfo() {
	    document.querySelector("#dept-id").textContent = ""
	    document.querySelector("#dept-name").textContent = ""
	    document.querySelector("#manager-name").textContent = "";
	    document.querySelector("#emp-count").textContent = "";
	 }
	 
	// 부서정보 테이블에 부서정보를 출력한다.
	function displayDeptInfo(dept, len) {
	    document.querySelector("#dept-id").textContent = dept.id
	    document.querySelector("#dept-name").textContent = dept.name
	    if (dept.manager) {
	       let fullName = dept.manager.firstName + " " + dept.manager.lastName
	       document.querySelector("#manager-name").textContent = fullName;
	    }
	    document.querySelector("#emp-count").textContent = len;
	 }
	
	// 직원목록 테이블에 직원목록을 출력한다.
	function displayEmployees(employees) {
	    let htmlContent = "";
	    employees.forEach(function(emp, index) {
	       htmlContent += `
	          <tr>
	             <td>\${emp.id}</td>
	             <td>\${emp.firstName} \${emp.lastName}</td>
	             <td>\${emp.job.id}</td>
	             <td>\${emp.hireDate.substr(0, 10)}</td>
	             <td>\${emp.salary}</td>
	             <td><button class="btn btn-outline-primary btn-sm" onclick="showEmployeeModal(\${emp.id})">상세정보</button></td>
	          </tr>
	       `;
	    });
	    document.querySelector("#table-employees tbody").innerHTML = htmlContent;
	 }
 
	// 부서명을 클릭했을 때 실행되는 이벤트 핸들러 함수다.
	// 클릭한 부서의 부서아이디를 조회해서 ajax방식으로 서버에 요청을 보낸다.
	// 서버가 응답으로 보낸 json형식의 텍스트를 분석해서 부서정보, 직원정보를 출력한다.
	function getDeptDetail(event, deptId){
		event.preventDefault();
		
		let elements = document.querySelectorAll("#dept-list a");
		//elements.forEach(el => el.classList.remove('active'));
		elements.forEach(function(el, index){
			el.classList.remove('active');
		})
		
		let clickedElement = document.querySelector("#dept-" + deptId);
		clickedElement.classList.add('active');
		
		// ajax 코딩하기
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200){
				let text = xhr.responseText;
				let result = JSON.parse(text);
				
				// 부서정보 표현하기
	            clearDeptInfo();
	            displayDeptInfo(result.dept, result.employees.length);
	            
	            // 직원리스트 표현하기
	            displayEmployees(result.employees)
				
				
				
			}
		}
		xhr.open("get", "detail?id=" + deptId);
		xhr.send();
	}
</script>
</body>
</html>