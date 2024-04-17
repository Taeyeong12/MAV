<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>업체 마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/1a6288a620.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	border: 1px solid rgb(221, 223, 237);
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
	font-size: 1.0rem;
	font-weight: bold;
	margin-bottom: 0.5rem;
	color: #343a40;
}

.room-dt {
	text-align: left;
}

.romm-ddt {
	background-color: rgba(235, 235, 235, 0.9);
	border-radius: 0.25rem;
	padding: 0 0.5rem;
}

.room-date {
	font-weight: bold;
}

.room-application-btn {
	padding: 0.5rem 1rem;
	background-color: #007bff;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
}

.room-application-btn4 {
	padding: 0.5rem 1rem;
	background-color: #FEA51d;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
	border: none;
}

.room-application-btn5 {
	padding: 0.5rem 1rem;
	background-color: #3A4CA8;
	color: white;
	border-radius: 0.25rem;
	text-decoration: none;
	border: none;
}

.room-info {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 1rem;
}

.modal-mid {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 0.5rem;
}

.modal-mid-bt {
	margin: 0 1rem
}

.modal-mid-title-bt {
	display: flex;
	justify-content: space-btween;
	align-items: center;
	font-size: 0.5rem;
}

.title-flex {
	display: flex;
	justify-content: space-between;
}

#createRoomDropdown, #createTournamentDropdown {
	background-color: rgb(253, 241, 241);
	border-radius: 4px;
}
</style>
<script type="text/javascript">
	function confirmDelete(roomNum) {
		if (window.confirm("매칭대기중인 방입니다. 정말로 삭제하시겠습니까?")) {
			window.location.href = "<c:url value='/room/deleteMyRoom'/>?roomNum="
					+ roomNum;
		}
	}
	$(document)
			.ready(
					function() {
						// 모든 버튼에 대한 클릭 이벤트 핸들러
						$(
								'#roomManagementButton, #MatchRoomManagementButton, #ResultManagementButton, #TournamentButton')
								.click(
										function(e) {
											e.preventDefault();

											// 각 버튼에 대한 AJAX 요청 URL
											var urls = {
												'roomManagementButton' : './store/RoomManagement',
												'MatchRoomManagementButton' : './store/MatchRoomManagement',
												'ResultManagementButton' : './store/ResultManagement',
												'TournamentButton' : './tournament/tournamentManagement'
											};

											// 각 버튼에 대한 컨텐츠 ID
											var contents = {
												'roomManagementButton' : '#content1',
												'MatchRoomManagementButton' : '#content2',
												'ResultManagementButton' : '#content3',
												'TournamentButton' : '#content4'
											};

											// 클릭한 버튼의 ID를 가져옵니다.
											var id = $(this).attr('id');

											// 다른 컨텐츠들을 숨깁니다.
											$.each(contents, function(key,
													value) {
												if (key !== id)
													$(value).hide();
											});

											// AJAX 요청을 보냅니다.
											$.ajax({
												url : urls[id],
												type : 'get',
												dataType : 'html',
												success : function(data) {
													// 해당 컨텐츠를 보이게 하고, 데이터를 채웁니다.
													$(contents[id]).show()
															.html(data);
												},
												error : function(xhr, status,
														error) {
													console.error(
															'AJAX 요청 실패:',
															error);
												}
											});
										});
					});

	document.addEventListener("DOMContentLoaded", function() {
		// '경기장 관리' 버튼에 클릭 이벤트 리스너를 추가합니다.
		document.getElementById("roomManagementButton").addEventListener(
				"click",
				function() {
					// '경기장 만들기' 드롭다운의 현재 표시 상태를 가져옵니다.
					var createRoomDropdown = document
							.getElementById("createRoomDropdown");
					if (createRoomDropdown.style.display === "none") {
						// 드롭다운이 숨겨져 있으면 보이게 합니다.
						createRoomDropdown.style.display = "block";
					} else {
						// 드롭다운이 보이고 있으면 숨깁니다.
						createRoomDropdown.style.display = "none";
					}
				});
	});
	document.addEventListener("DOMContentLoaded", function() {
		// '토너먼트 관리' 버튼에 클릭 이벤트 리스너를 추가합니다.
		document.getElementById("TournamentButton").addEventListener(
				"click",
				function() {
					// '토너먼트 등록' 드롭다운의 현재 표시 상태를 가져옵니다.
					var createTournamentDropdown = document
							.getElementById("createTournamentDropdown");
					if (createTournamentDropdown.style.display === "none") {
						// 드롭다운이 숨겨져 있으면 보이게 합니다.
						createTournamentDropdown.style.display = "block";
					} else {
						// 드롭다운이 보이고 있으면 숨깁니다.
						createTournamentDropdown.style.display = "none";
					}
				});
	});
</script>

</head>

<body>
<jsp:include page="./section/nav.jsp" />
<div class="main-container">
    <div class="main">
        <div class="col-4">
            <div class="card mt-2 pt-3" style="margin: 0 auto; background-color: rgb(153, 162, 209);">
                <div style="margin: 0 auto;">
                    <div class="card-m" style="margin: 0 auto; width:100%;text-align: center;">
                        <img src="<c:url value='/resources/images/${store.storeImageName1}'/>" class="d-block rounded-pill mx-auto" style="width:160px; height:160px; border:1px solid rgb(221, 223, 237); ">
                    </div>
                    <div class="card-body">
                        <b><p class="card-text" style="text-align: center; font-size: 1.5rem; color:white;">${store.storeName} 매니저</p></b>                        
                    </div>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item "><a href="#" id="roomManagementButton">경기장관리</a>
                        <div id="createRoomDropdown" style="display: none;">
                            <a href="./room/addrooms" class=""><span> - 경기장만들기</span></a>
                        </div></li>
                    <li class="list-group-item"><a href="#" id="MatchRoomManagementButton">매칭룸관리</a></li>
                    <li class="list-group-item"><a href="#" id="ResultManagementButton">결과관리</a></li>
                        <div id="createTournamentDropdown" style="display: none;">
                            <a href="./tournament/addtournament" class=""><span>
                                    - 토너먼트 만들기</span></a>
                        </div></li>
                    <li class="list-group-item"><a href="store/delete?storeId=${store.storeId}">업주탈퇴</a></li>
                    <li class="list-group-item"><a href="store/update?storeId=${store.storeId}" class="card-link">정보수정</a></li>
                </ul>
            </div>
        </div>
        <div class="col-7">
            <div class="card">
               <img src="<c:url value='/resources/images/${store.storeImageName2}'/>" class="" style="width:100%; height:300px; border:1px solid rgb(221, 223, 237); border-radius:5px;">
            </div>
            <br>
            <div>
                <div id="content1"></div>
                <div id="content2"></div>
                <div id="content3"></div>
                <div id="content4"></div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


</body>

</html>
