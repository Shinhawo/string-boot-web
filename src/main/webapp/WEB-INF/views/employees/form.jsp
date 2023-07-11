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
<div class="container mt-4">
   <div class="row mb-3">
      <div class="co1-12">
         <div class="card">
            <div class="card-header">신규 직원 등록폼</div>
            <div class="card-body">
               <form method="post" action="add">
                  <div class="row mb-3">
                     <label class="col-sm-1 col-form-label text-end">이름</label>
                     <div class="col-5 mb-3">
                        <input type="text" class="form-control" name="firstName" />
                     </div>
                     <div class="col-5 offset-1 mb-3">
                        <input type="text" class="form-control" name="lastName" />
                     </div>
                  </div>
                  <div class="row mb-3">
                     <label class="col-sm-1 col-form-label text-end">이메일</label>
                     <div class="col-5 mb-3">
                        <input type="text" class="form-control" name="email" />
                     </div>
                     <label class="col-sm-1 col-form-label text-end">연락처</label>
                     <div class="col-5 mb-3">
                        <input type="text" class="form-control" name="phoneNumber" />
                     </div>
                  </div>
                  <div class="row mb-3">
                     <label class="col-sm-1 col-form-label text-end">입사일</label>
                     <div class="col-5 mb-3">
                        <input type="date" class="form-control" name="hireDate" />
                     </div>
                     <label class="col-sm-1 col-form-label text-end">부서</label>
                     <div class="col-5 mb-3">
                        <select class="form-select" name="departmentId" onchange="changeDept()">
                            <option value="" selected disabled>부서를 선택하세요</option>
                            <c:forEach var="dept" items="${depts }">
                        		<option value="${dept.id }">${dept.name }</option>
                        	</c:forEach>
                        </select>
                     </div>
                  </div>
                  <div class="row mb-3">

                     <label class="col-sm-1 col-form-label text-end">직종</label>
                     <div class="col-5 mb-3">
                        <select class="form-select" name="jobId">
                            <option value="" selected disabled>직종을 선택하세요</option>
                        	<c:forEach var="job" items="${jobs }">
                        		<option value="${job.id }">${job.title }</option>
                        	</c:forEach>
                        </select>
                     </div>
                     <label class="col-sm-1 col-form-label text-end">관리자</label>
                     <div class="col-5 mb-3">
                        <select class="form-select" name="managerId" disabled>
                        </select>
                     </div>
                  </div>
                  <div class="row mb-3">
                     <label class="col-sm-1 col-form-label text-end">급여</label>
                     <div class="col-5 mb-3">
                        <input type="text" class="form-control" name="salary" />
                     </div>
                     <label class="col-sm-1 col-form-label text-end">커미션</label>
                     <div class="col-5 mb-3">
                        <input type="text" class="form-control" name="commissionPct" disabled/>
                     </div>
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
   <div class="row mb-3">
   		<div class="col-12">
   			<div class="card">
   				<div class="card-header">직원 일괄등록</div>
   				<div class="card-body">
   					<form method="post" action="upload" enctype="multipart/form-data">
	   					<div class="row mb-3">
	   						<label class="col-sm-1 col-form-label text-end">제목</label>
	   						<div class="col-9">
	   							<input type="text" class="form-control" name="title">
	   						</div>
	   					</div>
	   					<div class="row mb-3">
	                     <label class="col-sm-1 col-form-label text-end">첨부파일</label>
	                     <div class="col-9">
	                        <input type="file" accept=".xls,.xlsx" class="form-control" name="xlsfile" />
	                     </div>
	                     <div class="col-2 text-end">
	                       	<button type="submit" class="btn btn-primary btn-sm" >일괄등록</button>
	                     </div>
	                  </div>
   					</form>
   				</div>
   			</div>
   		</div>
   </div>
</div>
<script type="text/javascript">
/*
	- 요구사항
		* 부서를 선택하면 해당 부서에 소속된 직원을 조회해서 관리자 셀렉트박스에 표시한다.
			1. 관리자 셀랙트박스 엘리먼트를 조회한다.
				let el = document.querySelector("select[name=managerId]")
			2. 관리자 셀렉트박스 엘리먼트의 내부 HTML 컨텐츠를 적부 삭제한다.
				el.innerHTML = ""
			3. 관리자 셀렉트박스 엘리먼트를 활성화시킨다.
				el.disabled = flase;
			4. 현재 선택된 부서의 부서아이디를 조회한다.
				let deptId = document.querySelector("select[name=departmentId]").value
			5. XHR을 이용해서 서버로 ajax 요청을 보낸다.
				let xhr = new XMLHttpRequest();
				xhr.open("get", "empsByDeptId?deptId="+deptId);
				xhr.send
			6. XHR을 이용해서 서버가 보낸 AJAX 응답을 처리한다.
				// XHR객체의 responseText 프로퍼티에 저장된 응답데이터(json형식의 텍스트)를 조회한다.
				let text = xhr.responseText;
				// json 형식의 텍스트를 자바스크립트 배열로 변환한다.
				let emps = JSON.parse(text);
				// 배열의 데이터를 처리해서 관리자 셀렉터박스에 추가한 <option/> 태그를 생성한다.
				emps.forEach(function(emp) {
						options += `<option value="\${emp.id}">\${emp.firstName} \${emp.lastName}</option>`;
				});
				// 생성된 <option>태그를 관리자 셀렉트박스 엘리먼트에 추가한다.
				el.innerHTML = options;
		
		* Sales(부서아이디 80번) 부서를 선택하면 커미션입력필드를 활성화하고, 그외는 비활성화한다.
			1. 커미션 입력필드 엘리먼트를 선택한다.
				let el = document.querySelector("input[name=commissionPct]");
			2. 현재 선택된 부서아이디를 조회한다.
				let deptId = document.querySelector("select[name=departmentId]").value;
			3. 부서아이디가 80번이면 활성화하고, 그외는 비활성화한다.
				if (deptId === "80"){
					el.disabled = false;
				} else{
					el.disabled = true;
				}
 */
 	// 부서를 변경할 때 마다 실행되는 이벤트 핸들러 함수다.
	function changeDept() {
		refreshManagerField();
		toggleCommissionField();
	}
	
	// 현재 선택된 부서에 소속된 직원목록을 조회해서 관리자 셀렉터박스에 표시한다.
	function refreshManagerField(){
		let el = document.querySelector("select[name=managerId]");
		el.innerHTML = "";  // select박스의 내부 컨텐츠를 전부 지운다.
		el.disabled =false; // select박스를 활성화상태로 바꾼다.
		
		let deptId = document.querySelector("select[name=departmentId]").value
		
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200){
				let text = xhr.responseText;
				let emps = JSON.parse(text);
				if (emps.length === 0){
					el.disabled = true;
				}else {
					let options = "";
					emps.forEach(function(emp) {
						options += `<option value="\${emp.id}">\${emp.firstName} \${emp.lastName}</option>`;
					});
					el.innerHTML = options;
				}
			}
		}
		xhr.open("get", "empsByDept?deptId=" + deptId);
		xhr.send();
	}

	// 커미션 입력필드의 비활성화 상태를 변경한다.
	function toggleCommissionField() {
		let el =document.querySelector("input[name=commissionPct]")
		let deptId = document.querySelector("select[name=departmentId]").value;
		
		if (deptId === "80"){
			el.disabled = false;
		} else{
			el.disabled = true;
		}
	}
</script>
</body>
</html>