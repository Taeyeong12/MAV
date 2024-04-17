<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매칭 상세 페이지</title>
<script src="https://kit.fontawesome.com/1a6288a620.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

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

.carousel-inner img {
	width: 100%;
	height: 65vh;
	object-fit: cover;
}

.detail-box {
	padding: 1rem;
	margin-bottom: 2rem;
	border: 1px solid rgb(221, 223, 237);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	background-color: white;
}


.detail-row {
	display: flex;
	justify-content: space-between;
	flex-direction: row;
}

.detail-left {
	width: 70%;
}

.detail-left .detail-box {
	width: 100%;
	margin-bottom: 1rem;
}

.detail-right {
	width: 28%;
	flex-direction: column;
	display: flex;
}

.additional-info-box {
	padding: 1rem;
	margin-bottom: 2rem;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	background-color: white;
}

.boxes {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 1rem;
}

.room-application-btn4 {
	padding: 0.5rem 1rem;
	background-color: #3A4CA8;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
	border: none;
}

/* 기본 버튼 스타일 */
.btn.primary {
	background-color: transparent;
	border-color: #007bff;
	color: #007bff;
	transition: background-color 0.3s ease, border-color 0.3s ease, color
		0.3s ease;
}

.btn.warning {
	background-color: transparent;
	border-color: #ffc107;
	color: #ffc107;
	transition: background-color 0.3s ease, border-color 0.3s ease, color
		0.3s ease;
}

.btn.danger {
	background-color: transparent;
	border-color: #dc3545;
	color: #dc3545;
	transition: background-color 0.3s ease, border-color 0.3s ease, color
		0.3s ease;
}

/* 마우스 호버 시 배경색 변경 */
.btn:hover {
	background-color: #007bff !important;
	border-color: #007bff !important;
	color: #fff !important;
}

.modal-mid-bt {
	margin: 0 10px; /* 좌우 마진을 10px로 설정합니다. */
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
</head>
<body>
	<jsp:include page="./section/nav.jsp" />
	<div>
		<div id="carouselExampleIndicators" class="carousel slide container"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://static.nike.com/a/images/w_1920,c_limit,f_auto,q_auto/17b0c9a1-66b7-47f7-af08-84dbcce9acda/image.png"
						class="d-block w-100" alt="첫 번째 슬라이드">
				</div>
				<div class="carousel-item active">
					<img
						src="https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/cdef252c-ee93-4047-b52b-c8f0cb13e841/%EC%8A%A4%EC%9A%B0%EC%8B%9C-%EC%97%AC%EC%84%B1-%EB%93%9C%EB%9D%BC%EC%9D%B4-%ED%95%8F-%EC%BF%BC%ED%84%B0%EC%A7%91-%EB%AF%B8%EB%93%9C-%EB%A0%88%EC%9D%B4%EC%96%B4-4O4ifntv.png"
						class="d-block w-100" alt="첫 번째 슬라이드">
				</div>
				<div class="carousel-item active">
					<img
						src="https://static.nike.com/a/images/w_1920,c_limit,f_auto,q_auto/918325cf-fc65-4f3a-8d61-89495fc985d2/image.png"
						class="d-block w-100" alt="첫 번째 슬라이드">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<br>
		<div class="container">
			<!-- applicantId가 null이 아닌 경우에 실행되는 부분 -->
			<c:if test="${matching.applicantId != null}">
				<div class="detail-box boxes">
					<div class="text-center mr-3">
						<h2>${matching.creatorId}&nbsp;&nbsp;<img
								src="<c:url value="/resources/images/battle.png"/>"
								style="width: 8%;"> &nbsp;${matching.applicantId}
						</h2>
					</div>
					<!-- Button trigger modal -->
					<c:if test="${member.memberId == room.storeId}">

						<button type="button"
							class="room-application-link room-application-btn4"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							점수부여</button>
					</c:if>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-mid-title-bt">
										<div style="text-align: start;">
											<b><h5 class="modal-title " id="exampleModalLabel">&nbsp
													Home : ${matching.creatorId}&nbsp&nbsp&nbsp&nbsp</h5></b>
											<b><h5 class="modal-title " id="exampleModalLabel">&nbsp
													Away : ${matching.applicantId}</h5></b>
										</div>
									</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">

									<!-- 모달 수정해야 하는부분 -->
									<form:form modelAttribute="resultForm" method="post"
										action="/MAV/match/matchpoint">
										<input type="hidden" name="roomNum"
											value="${matching.roomNum}" />
										<input type="hidden" name="creatorId"
											value="${matching.creatorId}">
										<input type="hidden" name="applicantId"
											value="${matching.applicantId}">

										<div class="modal-mid text-center ">
											<button type="submit" name="result" value="승"
												class="btn btn-primary modal-mid-bt primary mdbt">&nbsp;&nbsp;승리&nbsp;&nbsp;</button>
											<button type="submit" name="result" value="무"
												class="btn btn-warning modal-mid-bt warning mdbt">&nbsp;&nbsp;무승부&nbsp;&nbsp;</button>
											<button type="submit" name="result" value="패"
												class="btn btn-danger modal-mid-bt danger mdbt">&nbsp;&nbsp;패배&nbsp;&nbsp;</button>
										</div>
									</form:form>
								</div>
								<div class="modal-footer">
									<div class="home">
										<b><p class="text-muted">※ Home기준</p></b>
									</div>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<div class="detail-row d-flex">
				<div class="detail-left">
					<div class="detail-box">
						<h1>${room.roomName}</h1>
						<p>참가인원 :${room.roomCount}&nbsp;&nbsp;&nbsp;&nbsp;수용인원
							:${room.roomCapacity}</p>
					</div>
					<div class="detail-box">
						<h2>상세내용</h2>
						<pre>${room.roomDetail}</pre>
					</div>
				</div>
				<div class="detail-right">
					<!-- applicantId가 null인 경우에 실행되는 부분 -->
					<c:if test="${matching.applicantId == null}">
						<div class="detail-box" style="height: 30rem;">
							<b><p>
									MatchDate :<b>
										<p><i class="fa-solid fa-calendar-days"></i>  ${room.roomDate}<br><i class="fa-solid fa-clock"></i>  ${room.roomTime}</p> <b><p>
												방제 : ${matching.matchTitle}<b>
													<p>동호회명 : ${matching.creatorId}
													<p>동호회 점수 : ${clubInfos.clubPoint} point
													<p>동호회 정보 : ${clubInfos.clubInfo} <a href="#">상세정보</a>

														<form:form modelAttribute="matching"
															action="${pageContext.request.contextPath}/match/matchingApply"
															method="post"
															onsubmit="return checkIds('${member.memberId}')">
															<div id="matching_bt">
																<form:hidden path="roomNum" value="${room.roomNum}" />
																<form:hidden path="creatorId"
																	value="${clubInfos.clubMaster}" id="creatorId" />
																<div class="selector">
																	<button type="submit" class="room-application-btn4 mt-2">매칭신청하기</button>
																	<br> <label for="clubSelect" class=" mt-3"></label><br>
																	<select name="selectedClub" id="clubSelect"
																		class="form-control form-select  mt-2 text-center">
																		<option value="none">==== 동호회 선택하기 ====</option>
																		<!-- 기본 옵션 -->
																		<c:forEach var="club" items="${memberClubs}">
																			<option value="${club.clubName}">${club.clubName}</option>
																		</c:forEach>
																	</select>
																	<!-- 추가적인 데이터 필드들을 여기에 추가 -->
																</div>
															</div>
														</form:form>
						</div>
					</c:if>
					<div class="detail-box additional-info-box" style="height: 30rem;">
						<div id="googleMapContainer">
							<div id="map" style="width: 100%; height: 450px; border: 0;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=617d72b728b3e792de22e82c5fd893fb"></script>
</body>
<script>
function checkIds(applicantId) {
    var creatorIdField = document.querySelector('#creatorId');
    var creatorId = creatorIdField.value;

    if (creatorId === applicantId) {
        alert("방장의 아이디와 동일한 아이디로 신청할 수 없습니다.");
        return false;
    }

    console.log("Creator ID: " + creatorId);
    console.log("Applicant ID: " + applicantId);

    var selectedClub = document.getElementById('clubSelect').value;
    if (selectedClub === "") {
        alert("동호회를 선택하세요.");
        return false;
    }

    return true;
}

function submitForm(result) {
    var form = document.getElementById('resultForm');
    form.action += "?result=" + result;
    form.submit();
}




//카카오 지도
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(${coordinate.latitude}, ${coordinate.longitude}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var marker = new kakao.maps.Marker();

//타일 로드가 완료되면 지도 중심에 마커를 표시합니다
kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

function displayMarker() {

// 마커의 위치를 지도중심으로 설정합니다 
marker.setPosition(map.getCenter()); 
marker.setMap(map); 

// 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
// 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
// kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
}
</script>

</html>
