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
}

body {
	background-color: #f8f9fa;
	color: #212529;
}

.main-container {
	width: 80%;
	margin: 0 auto;
	display: flex;
	margin-top: 30px;
}

.main {
	display: flex;
	padding: 2rem;
}

.col-4 {
	margin-right: auto;
}

.card {
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

.list-group-item:hover {
	background-color: #f8f9fa;
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
	padding: 0.5rem;
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
	margin-bottom: 1rem;
	color: #343a40;
}

.room-application-btn {
	padding: 0.5rem 1rem;
	background-color: #007bff;
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

.tab button:hover {
	
}

.tab button.active {
	
}

.tabcontent {
	display: none;
}

.list {
	padding: 0 30px;
}

.room-application-btn4 {
	padding: 0.5rem 1rem;
	background-color: #3A4CA8;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
	border: none;
}
</style>
<script>
	function openTab(evt, tabName) {
		console.log("opentab실행");
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(tabName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>
<title>마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="./section/nav.jsp" />
	<div class="main-container">
		<div class="user-info col-4">
			<div class="card" style="width: 100%;  background-color: rgb(153, 162, 209);">							
				<h5 class="card-title"
					style="text-align: center; font-size: 1.5rem; margin-top : 5px;">${member.memberName}</h5>
				<div class="card-body">
					<p class="card-text" style="text-align: center; font-size: 1rem;">${member.memberEmail}</p>
				</div>				
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a
						href="<c:url value='/member/update/member'/>?memberId=${member.memberId}">개인정보수정</a>
					</li>
					<li class="list-group-item"><a
						href="<c:url value='/member/delete/member'/>?memberId=${member.memberId}">회원탈퇴하기</a>
					</li>
					<c:choose>
						<c:when test="${store.storeId == null }">
							<li class="list-group-item"><a
								href="<c:url value='/store/add'/>?memberId=${member.memberId}">업체신청</a>
							</li>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${teacher.teacherId == null}">
							<li class="list-group-item"><a
								href="<c:url value='/teacher/add'/>?memberId=${member.memberId}">강사신청</a>
							</li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<div class="col-7 ">
			<div class="card mb-3" style="width: 100%;">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<p class="card-text" style="font-size: 1rem;">생년월일 :
							${member.memberBirth}</p>
					</li>
					<li class="list-group-item">
						<p class="card-text" style="font-size: 1rem;">주소 :
							${member.memberAddr}</p>
					</li>
					<li class="list-group-item">
						<p class="card-text" style="font-size: 1rem;">이메일 :
							${member.memberEmail}</p>
					</li>
					<li class="list-group-item">
						<p class="card-text" style="font-size: 1rem;">전화번호 :
							${member.memberPhone01}-${member.memberPhone02}-${member.memberPhone03}</p>
					</li>
				</ul>
			</div>
			<div class="card list" style="width: 100%;">
				<div class="room-title mt-3">내 동호회 리스트</div>
				<c:forEach items="${clubs}" var="clubs">
					<div class="card-1 mb-3">
						<div class="room-info">
							<span class="room-title">&nbsp;&nbsp;${clubs.clubName}</span> <span
								class="room-date">동호회 종류 :
								${clubs.clubCategory}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span class="room-application"> <a
								href="<c:url value='/club/clubinfo'/>?clubName=${clubs.clubName}"
								class="room-application-btn4 room-application-link room-application-btn">동호회
									상세정보</a>
							</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>