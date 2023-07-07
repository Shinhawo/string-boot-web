<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark border-bottom">
   <div class="container">
      <a class="navbar-brand" href="/">인사관리</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
         aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item ">
               <a class="nav-link ${menu eq'홈' ? 'active' : '' }" href="/">홈</a>
            </li>
            <li class="nav-item ">
               <a class="nav-link ${menu eq'부서' ? 'active' : '' }" href="/dept/list">부서관리</a>
            </li>
            <li class="nav-item ">
               <a class="nav-link ${menu eq'직종' ? 'active' : '' }" href="/job/list">직종관리</a>
            </li>
            <li class="nav-item ">
               <a class="nav-link ${menu eq'직원' ? 'active' : '' }" href="/emp/list">직원관리</a>
            </li>
            
         </ul>
         <ul class="navbar-nav">
            <li class="nav-item">
               <a class="nav-link" href="/login">로그인</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/logout">로그아웃</a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/register">회원가입</a>
            </li>
         </ul>
      </div>
   </div>
</nav>