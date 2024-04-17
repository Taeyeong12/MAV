<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
	list-style : none;
}

.main-container {
	width: 80%;
	margin: 0 auto;
}

.main {
	display: flex;
	padding: 2rem;
}

.col-4 {
	margin-right: auto;
}

.card {
	border: 1px solid rgb(221, 223, 237);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	border: none;
}

.img1 {
	border-radius: 50%;
	width: 50%;
	margin: 0 auto;
}

.right, .right-name {
	display: flex;
}

.right img {
	width: 30%;
}

.card-title, .card-text {
	margin: 0;
}

.list-group-item a {
	text-decoration: none;
	color: #212529;
}

.card-link {
	color: #007bff;
	text-decoration: none;
}

.card-link:hover {
	text-decoration: underline;
}

.card h5 {
	font-size: 1.2rem;
	margin-bottom: 1rem;
}

.card-1 {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 1rem;
	margin-bottom: 1.5rem;
	border: 1px solid #dee2e6;
	border-radius: 0.25rem;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 2rem;
	margin-bottom: 1.5rem;
	color: #007bff;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.room-title {
	font-size: 1.2rem;	
	color: #343a40;
}

.room-application-btn4 {
	padding: 0.5rem 1rem;
	background-color: #3A4CA8;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
}

.room-info {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.tab {
	overflow: hidden;
}

.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
}

.tabcontent {
	display: none;
}
.room-application
{
	display : flex !important;
	justify-content : space-between;
}

.main-body {
	display: flex;
	justify-content: space-around;
}
.room-application-btn43 {
	padding: 0.5rem 1rem;
	margin: 0 auto;
	background-color: #3A4CA8;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
}

li:hover
{
	display: block !important;
}
</style>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var deleteclub = document.getElementById('deleteClub');

		deleteclub.addEventListener('click', function(event) {
			event.preventDefault(); // 기본 이벤트(링크 이동) 방지

			// 경고창을 표시하고, 사용자의 응답에 따라 처리
			var confirmation = confirm("정말로 이 클럽을 삭제하시겠습니까?");
			if (confirmation) {
				window.location.href = "/MAV/club/delete";
			}
		});
	});
</script>
<title>클럽 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="./section/nav.jsp" />
	<div class="main-container">
		<div class="main-body mt-2">
			<div class="col-3" style="text-align: center">
				<div class="card" style="width: 100%;">
						<h5 class="card-title mt-2"
							style="text-align: center; font-size: 1.5rem;">${club.clubName}</h5>					
					<div class="card-body">
						<div style="margin: 0 auto; width: 50%;">
							<p class="card-text" style="text-align: left; font-size: 1rem;">동호회
								종류 : ${club.clubCategory}</p>
						</div>
						<div style="margin: 0 auto; width: 50%;">
							<p class="card-text" style="text-align: left; font-size: 1rem;">동호회
								활동지역 : ${club.clubLocale}</p>
						</div>
						<div style="margin: 0 auto; width: 50%;">
							<p class="card-text" style="text-align: left; font-size: 1rem;">동호회
								포인트 : ${club.clubPoint}Point</p>
						</div>
					</div>
					<div class="card-body row float-center" style="text-align: center">
						<c:choose>
							<c:when test="${member.memberId eq club.clubMaster}">
								<a href="/MAV/club/update"
									class="room-application-btn43 mb-2 col-9">클럽 수정하기</a>
								<a href="/MAV/club/delete"
									class="room-application-btn43 mb-2 col-9" id="deleteClub">클럽
									삭제하기</a>
							</c:when>
						</c:choose>
						<c:forEach items="${memberList}" var="memberList">
							<c:choose>
								<c:when test="${member.memberId eq memberList.c_memberId}">
									<a href="/MAV/club/leaveclub"
										class="room-application-btn43 mb-2 col-9">클럽 탈퇴하기</a>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-8">
				<div class="room-title mb-3">동호회원 리스트</div>
				<c:forEach items="${memberList}" var="memberList">
					<c:choose>
						<c:when
							test="${club.clubName eq memberList.clubName and (memberList.clubGrade eq '정회원' or memberList.clubGrade eq '동호회장')}">
							<div class="card-1 mb-3">
								<div class="room-info">
									<span class="room-title">동호회원 아이디 :
										${memberList.c_memberId}</span>										
										<span class="room-application"><a href="<c:url value='/club/memberDetails'/>?memberId=${memberList.c_memberId}"
										class="room-application-btn4">동호회원 정보보기</a> 
										<li class="dropdown room-application-btn43 room-application" style="margin-left : 5px;">
						                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						                      동호회원 등급조정
						                    </a>
						                    <ul class="dropdown-menu">
						                      <li><a class="dropdown-item" 
						                      		href="<c:url value='/club/memberupdate2'/>?c_memberId=${memberList.c_memberId}&clubName=${memberList.clubName}">동호회장</a></li>
						                      <li><hr class="dropdown-divider"></li>
						                      <li><a class="dropdown-item" 
						                      		href="<c:url value='/club/memberupdate'/>?c_memberId=${memberList.c_memberId}&clubName=${memberList.clubName}">정회원</a></li>
						                    </ul> 
					                    </li>
					                    <a href="<c:url value='/club/ejection'/>?c_memberId=${memberList.c_memberId}&clubName=${memberList.clubName}" 
					                    	class="room-application-btn43" 
					                    	style="margin-left : 5px;">동호회원 강퇴하기</a>
									</span>									
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
				<hr>
				<div class="col-12">
					<div class="room-title mb-3">가입대기자 리스트</div>
					<c:forEach items="${memberList}" var="memberList">
						<c:choose>
							<c:when
								test="${club.clubName eq memberList.clubName and (memberList.clubGrade eq '준회원')}">
								<div class="card-1 mb-3">
									<div class="room-info">
										<span class="room-title">동호회원 아이디 :
											${memberList.c_memberId}</span> <span class="room-application">
											<a
											href="<c:url value='/club/memberDetails'/>?memberId=${memberList.c_memberId}"
											class="room-application-btn4" style="margin-left : 5px;">동호회원 정보보기</a> <a
											href="<c:url value='/club/memberupdate'/>?c_memberId=${memberList.c_memberId}&clubName=${memberList.clubName}"
											class="room-application-btn43" style="margin-left : 5px;">동호회원 가입승인</a> <a
											href="<c:url value='/club/ejection'/>?c_memberId=${memberList.c_memberId}&clubName=${memberList.clubName}"
											class="room-application-btn43" style="margin-left : 5px;">동호회원 가입거부</a>
										</span>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
	    document.querySelectorAll('.room-application-btn4').forEach(item => {
	        item.addEventListener('click', event => {
	            const url = item.getAttribute('href');
	            window.open(url, '_blank', 'width=800,height=375');
	            event.preventDefault();
	        });
	    });
	</script>
	
</body>
</html>