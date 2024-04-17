<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>      
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .navbody
        {
            background-color: #FFFFFD !important;
        }
        /* MAV 글자 색상 변경 */
        .navbar-brand {

            font-weight: bold;
            padding : 0 !important;       
            color: #3A4CA8;
            font-weight: bold;         
        }
        .nav-item:hover
        {
        	text-decoration: underline;
        	color: #3A4CA8;
        }
        /* 검색 버튼 텍스트 색상 변경 */
        .btn-outline-success {
            color: #28BEA2;
        }

        /* 검색 버튼 테두리 색상 변경 */
        .btn-outline-success {
            border-color:#d3d3d3;
            font-weight: bold;   
        }
        .nav-container
		{
			background: rgb(248,249,250);
			border-bottom: 1px solid #d3d3d3; 
		}
		.nav-inner
		{
			width:80%;
			margin : 0 auto;
		}
		h5
		{
			margin-bottom: 0 !important;
		}
    </style>   
</head>
<body>
<div class="nav-container">
	<div class="nav-inner">
	    <c:choose>
		    <c:when test="${!empty member.memberId}">
		    	<c:choose>
		    		<c:when test="${teacher.teacherApprove eq true && store.storeApprove eq true}">
			       	    <nav class="navbar navbar-expand-lg bg-body-tertiary">
			            <div class="container-fluid">
			              <a class="navbar-brand" href="/MAV/main"><img src="<c:url value="/resources/images/MAVlogo.png"/>" style="width : 150px; height : 45px;"></a>
			              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			                <span class="navbar-toggler-icon"></span>
			              </button>
			              <div class="collapse navbar-collapse" id="navbarSupportedContent">
			                <ul class="navbar-nav me-auto mb-2 mb-lg-0">			                  
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      동호회
			                    </a>
			                    <ul class="dropdown-menu">
			                      <li><a class="dropdown-item" href="/MAV/club/add">동호회 생성</a></li>
			                      <li><hr class="dropdown-divider"></li>
			                      <li><a class="dropdown-item" href="/MAV/club/list">동호회 리스트</a></li>
			                    </ul>
			                  </li>
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      매칭
			                    </a>
			                   <ul class="dropdown-menu">
	                               <li><a class="dropdown-item" href="/MAV/room/roomView">경기장</a></li>
	                               <li><hr class="dropdown-divider"></li>
	                               <li><a class="dropdown-item" href="/MAV/match/matchingView">매칭신청하기</a></li>                               
	                             </ul>
			                  </li>
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      강의
			                    </a>
			                    <ul class="dropdown-menu">
			                      <li><a class="dropdown-item" href="/MAV/Class/addclass">강의등록</a></li>
			                      <li><hr class="dropdown-divider"></li>
			                      <li><a class="dropdown-item" href="/MAV/Class/classlist">강의리스트</a></li>
			                      <li><hr class="dropdown-divider"></li>
			                      <li><a class="dropdown-item" href="/MAV/teacher?teacherId=${member.memberId}">강사페이지</a></li>
			                    </ul>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/store?storeId=${member.memberId}">업체관리</a>
			                  </li>
			                  <li class="nav-item">
			                     <a class="nav-link active" aria-disabled="true" href="/MAV/notice/list">공지사항 목록</a>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/logout">로그아웃</a>
			                  </li>
			                   <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/member/mypage">마이페이지</a>
			                  </li>
			                </ul>
			                <h5>${member.memberName} 강사&업주님 환영합니다!</h5>			             
			              </div>
			            </div>
			        </nav>		        
			        </c:when>
		    		<c:when test="${teacher.teacherApprove eq true}">
			       	    <nav class="navbar navbar-expand-lg bg-body-tertiary">
			            <div class="container-fluid">
			              <a class="navbar-brand" href="/MAV/main"><img src="<c:url value="/resources/images/MAVlogo.png"/>" style="width : 150px; height : 45px;"></a>
			              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			                <span class="navbar-toggler-icon"></span>
			              </button>
			              <div class="collapse navbar-collapse" id="navbarSupportedContent">
			                <ul class="navbar-nav me-auto mb-2 mb-lg-0">			                  
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      동호회
			                    </a>
			                    <ul class="dropdown-menu">
			                      <li><a class="dropdown-item" href="/MAV/club/add">동호회 생성</a></li>
			                      <li><hr class="dropdown-divider"></li>
			                      <li><a class="dropdown-item" href="/MAV/club/list">동호회 리스트</a></li>
			                    </ul>
			                  </li>
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      매칭
			                    </a>
			                    <ul class="dropdown-menu">
	                               <li><a class="dropdown-item" href="/MAV/room/roomView">경기장</a></li>
	                               <li><hr class="dropdown-divider"></li>
	                               <li><a class="dropdown-item" href="/MAV/match/matchingView">매칭신청하기</a></li>                               
	                             </ul>
			                  </li>
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      강의
			                    </a>
			                    <ul class="dropdown-menu">
			                      <li><a class="dropdown-item" href="/MAV/Class/addclass">강의등록</a></li>
			                      <li><hr class="dropdown-divider"></li>
			                      <li><a class="dropdown-item" href="/MAV/Class/classlist">강의리스트</a></li>
			                      <li><hr class="dropdown-divider"></li>
			                      <li><a class="dropdown-item" href="/MAV/teacher?teacherId=${member.memberId}">강사페이지</a></li>
			                    </ul>
			                  </li>
			                  <li class="nav-item">
			                     <a class="nav-link active" aria-disabled="true" href="/MAV/notice/list">공지사항 목록</a>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/logout">로그아웃</a>
			                  </li>
			                   <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/member/mypage">마이페이지</a>
			                  </li>
			                </ul>
			                <h5>${member.memberName} 강사님 환영합니다!</h5>			                
			              </div>
			            </div>
			        </nav>
			       </c:when>
			        <c:when test="${store.storeApprove eq true}">
			       	    <nav class="navbar navbar-expand-lg bg-body-tertiary">
			            <div class="container-fluid">
			              <a class="navbar-brand" href="/MAV/main"><img src="<c:url value="/resources/images/MAVlogo.png"/>" style="width : 150px; height : 45px;"></a>
			              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			                <span class="navbar-toggler-icon"></span>
			              </button>
			              <div class="collapse navbar-collapse" id="navbarSupportedContent">
			                <ul class="navbar-nav me-auto mb-2 mb-lg-0">			                  
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      동호회
			                    </a>
			                    <ul class="dropdown-menu">
			                      <li><a class="dropdown-item" href="/MAV/club/add">동호회 생성</a></li>
			                      <li><hr class="dropdown-divider"></li>
			                      <li><a class="dropdown-item" href="/MAV/club/list">동호회 리스트</a></li>
			                    </ul>
			                  </li>
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      매칭
			                    </a>
			                   <ul class="dropdown-menu">
	                               <li><a class="dropdown-item" href="/MAV/room/roomView">경기장</a></li>
	                               <li><hr class="dropdown-divider"></li>
	                               <li><a class="dropdown-item" href="/MAV/match/matchingView">매칭신청하기</a></li>                               
	                             </ul>

			                  </li>
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      강의
			                    </a>
			                    <ul class="dropdown-menu">			                 
			                      <li><a class="dropdown-item" href="/MAV/Class/classlist">강의리스트</a></li>			                 
			                    </ul>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/store?storeId=${member.memberId}">업체관리</a>
			                  </li>           
			                  <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/logout">로그아웃</a>
			                  </li>
			                   <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/member/mypage">마이페이지</a>
			                  </li>
			                </ul>
			                <h5>${member.memberName} 업주님 환영합니다!</h5>			                
			              </div>
			            </div>
			        </nav>
			       </c:when>
			         <c:when test="${member.adminApprove eq true}">
			       	    <nav class="navbar navbar-expand-lg bg-body-tertiary">
					            <div class="container-fluid">
					              <a class="navbar-brand" href="/MAV/main"><img src="<c:url value="/resources/images/MAVlogo.png"/>" style="width : 150px; height : 45px;"></a>
					              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					                <span class="navbar-toggler-icon"></span>
					              </button>
					              <div class="collapse navbar-collapse" id="navbarSupportedContent">
					                <ul class="navbar-nav me-auto mb-2 mb-lg-0">					                 
					                  <li class="nav-item dropdown">
					                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					                      동호회
					                    </a>
					                    <ul class="dropdown-menu">
					                      <li><a class="dropdown-item" href="/MAV/club/add">동호회 생성</a></li>
					                      <li><hr class="dropdown-divider"></li>
					                      <li><a class="dropdown-item" href="/MAV/club/list">동호회 리스트</a></li>
					                    </ul>
					                  </li>
					                  <li class="nav-item dropdown">
					                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					                      매칭
					                    </a>
					                    <ul class="dropdown-menu">
			                           <li><a class="dropdown-item" href="/MAV/room/roomView">경기장</a></li>
			                               <li><hr class="dropdown-divider"></li>
			                               <li><a class="dropdown-item" href="/MAV/match/matchingView">매칭신청하기</a></li>                               
			                             </ul>			                    
					                  </li>	
					                  <li class="nav-item">
					                     <a class="nav-link active" aria-disabled="true" href="/MAV/notice/list">공지사항 목록</a>
					                  </li>
					                  <li class="nav-item">
					                   	<a class="nav-link active" aria-disabled="true" href="/MAV/admin/adminpage">관리자 페이지</a>
					                  </li>			                  
					                  
					                  <li class="nav-item">
					                    <a class="nav-link active" aria-disabled="true" href="/MAV/logout">로그아웃</a>
					                  </li>
					                   <li class="nav-item">
					                    <a class="nav-link active" aria-disabled="true" href="/MAV/member/mypage">마이페이지</a>
					                  </li>
					                </ul>
					                <h5>${member.memberName} 관리자님 환영합니다!</h5>					                
					              </div>
					            </div>
					        </nav>
			        </c:when>
			        <c:otherwise>
			        	<nav class="navbar navbar-expand-lg bg-body-tertiary">
					            <div class="container-fluid">
					              <a class="navbar-brand" href="/MAV/main"><img src="<c:url value="/resources/images/MAVlogo.png"/>" style="width : 150px; height : 45px;"></a>
					              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					                <span class="navbar-toggler-icon"></span>
					              </button>
					              <div class="collapse navbar-collapse" id="navbarSupportedContent">
					                <ul class="navbar-nav me-auto mb-2 mb-lg-0">					                  
					                  <li class="nav-item dropdown">
					                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					                      동호회
					                    </a>
					                    <ul class="dropdown-menu">
					                      <li><a class="dropdown-item" href="/MAV/club/add">동호회 생성</a></li>
					                      <li><hr class="dropdown-divider"></li>
					                      <li><a class="dropdown-item" href="/MAV/club/list">동호회 리스트</a></li>
					                    </ul>
					                  </li>
					                  <li class="nav-item dropdown">
					                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					                      매칭
					                    </a>
					                    <ul class="dropdown-menu">
			                               <li><a class="dropdown-item" href="/MAV/room/roomView">경기장</a></li>
			                               <li><hr class="dropdown-divider"></li>
			                               <li><a class="dropdown-item" href="/MAV/match/matchingView">매칭신청하기</a></li>                               
			                             </ul>
					                  </li>
					                  <li class="nav-item dropdown">
					                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					                      강의
					                    </a>
					                    <ul class="dropdown-menu">			                 
					                      <li><a class="dropdown-item" href="/MAV/Class/classlist">강의리스트</a></li>			                 
					                    </ul>
					                  </li>
					                  <li class="nav-item">
					                     <a class="nav-link active" aria-disabled="true" href="/MAV/notice/list">공지사항 목록</a>
					                  </li>   
					                  <li class="nav-item">
					                    <a class="nav-link active" aria-disabled="true" href="/MAV/logout">로그아웃</a>
					                  </li>
					                   <li class="nav-item">
					                    <a class="nav-link active" aria-disabled="true" href="/MAV/member/mypage">마이페이지</a>
					                  </li>
					                </ul>
					                <h5>${member.memberName} 회원님 환영합니다!</h5>					                
					              </div>
					            </div>
					        </nav>
			        </c:otherwise>
			       </c:choose>
			</c:when>
	        <c:otherwise>
	       		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			            <div class="container-fluid">
			              <a class="navbar-brand" href="/MAV/main"><img src="<c:url value="/resources/images/MAVlogo.png"/>" style="width : 150px; height : 45px;"></a>
			              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			                <span class="navbar-toggler-icon"></span>
			              </button>
			              <div class="collapse navbar-collapse" id="navbarSupportedContent">
			                <ul class="navbar-nav me-auto mb-2 mb-lg-0">			                  
			                  <li class="nav-item">
			                    <a class="nav-link" href="#">동호회</a>
			                  </li>
			                  <li class="nav-item dropdown">
			                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                      매칭
			                    </a>
			                    <ul class="dropdown-menu">
	                               <li><a class="dropdown-item" href="/MAV/room/roomView">경기장</a></li>
	                               <li><hr class="dropdown-divider"></li>
	                               <li><a class="dropdown-item" href="/MAV/match/matchingView">매칭신청하기</a></li>                               
	                             </ul>
			                  </li>
			                  <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/login">로그인</a>
			                  </li>
			                   <li class="nav-item">
			                    <a class="nav-link active" aria-disabled="true" href="/MAV/member/add/member">회원가입</a>
			                  </li>
			                </ul>			                
			              </div>
			            </div>
			        </nav>
	       </c:otherwise>
		</c:choose>
	</div>
</div>
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>       