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

.main-body {
	display: flex;
	justify-content: space-between;
}

.clubImages img {
	margin-top: 10px;
	margin-bottom: 10px;
}

.room-application-btn4 {
	padding: 0.5rem 1rem;
	margin: 0 auto;
	background-color: #3A4CA8;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
	border: none;
}

</style>
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
		<div class="main-body mt-3">
			<div class="col-3">
				<div class="card" style="width: 100%;">
					<h5 class="card-title mt-2"
						style="text-align: center; font-size: 1.5rem;">${club.clubName}</h5>					
					<div class="card-body card-content">
							<div  style="margin:0 auto; width: 50%;">
								<p class="card-text" style="text-align: left; font-size: 1rem;">동호회
									종류 : ${club.clubCategory}</p>
							</div>
							<div  style="margin:0 auto; width: 50%;">
								<p class="card-text" style="text-align: left; font-size: 1rem;">동호회
								활동지역 : ${club.clubLocale}</p>
							</div>
							<div  style="margin:0 auto; width: 50%;">
								<p class="card-text" style="text-align: left; font-size: 1rem;">동호회
								포인트 : ${club.clubPoint}Point</p>
							</div>
					</div>
					<div class="card-body row" style="text-align: center">
						<c:choose>
							<c:when test="${empty clubmember.c_memberId}">
								<a href="/MAV/club/join" class="room-application-btn4 col-9">클럽
									가입신청</a>
							</c:when>
							<c:when test="${member.memberId eq club.clubMaster}">
								<a href="/MAV/club/clubsetting?clubName=${club.clubName}"
									class="room-application-btn4 mb-1 col-9">클럽 관리</a>
								<a href="/MAV/club/leaveclub"
									class="room-application-btn4 mb-1 col-9">클럽 탈퇴하기</a>
							</c:when>
							<c:otherwise>
								<a href="/MAV/club/leaveclub" class="room-application-btn4 col-9">클럽
									탈퇴하기</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="col-8" style="text-align: center">
				<div class="card" style="text-align: center">
					<h5 class="mt-2">동호회 소개글</h5>
					<div class="col-12 mb-3 clubImages">
						<img class="clubImage"
							src="<c:url value="/resources/images/${club.imageFileName1}"/>"
							class="" width="80%" height="450px"> <img class="clubImage"
							src="<c:url value="/resources/images/${club.imageFileName2}"/>"
							class="" width="70%"> <img class="clubImage"
							src="<c:url value="/resources/images/${club.imageFileName3}"/>"
							class="" width="70%"> <img class="clubImage"
							src="<c:url value="/resources/images/${club.imageFileName4}"/>"
							class="" width="70%"> <img class="clubImage"
							src="<c:url value="/resources/images/${club.imageFileName5}"/>"
							class="" width="70%">
					</div>
					<div class="col-12">
						<p>
						<pre>${club.clubInfo}</pre>
						</p>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 이미지 요소 가져오기
		var imgList = document.getElementsByClassName('clubImage');

		// 이미지가 로드되지 않았을 경우를 처리할 수도 있습니다.
		for (var i = 0; i < imgList.length; i++) {
			var img = imgList[i];
			if (!img.complete || img.naturalWidth === 0) {
				img.style.display = "none"; // 대체할 기본 이미지 경로 설정
			}
		}
	</script>
</body>
</html>