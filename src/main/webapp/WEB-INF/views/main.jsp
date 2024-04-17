<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인 페이지</title>
    <script src="https://kit.fontawesome.com/1a6288a620.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none !important;

        }

        .main-container {
            width: 80%;
            margin: 0 auto;
        }

        .innershadow:hover {
            color: red;
        }

        .innershadow2:hover {
            color: rgb(14, 14, 192);

        }

        /* ë ì§ ì íê¸° ì¤íì¼ë§ */
        input[type="date"] {

            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;

        }

        /* ì íë ë ì§ ì¤íì¼ë§ */
        input[type="date"]::-webkit-datetime-edit {

            color: #333;
            font-weight: bold;

        }

        /* ë¬ë ¥ ìì´ì½ ì¤íì¼ë§ */
        input[type="date"]::-webkit-calendar-picker-indicator {

            background-color: #ccc;
            padding: 4px;
            border-radius: 50%;
            cursor: pointer;
        }

        .matchlist {
            align-items: center;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .matchinfo {
            align-items: center;
        }

        hr {
            margin-bottom: 0 !important;
        }

        .list-container {
            max-width: 100%;
            display: flex;
            justify-content: space-between;

        }

        .room-application-btn4 {
            padding: 0.5rem 1rem;
            background-color: #3A4CA8;
            color: white;
            border-radius: 0.25rem;
            text-decoration: none;
            border: none;
        }

        .main {
            display: flex;
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

        .right,
        .right-name {
            display: flex;
        }

        .right img {
            width: 30%;
        }

        .card-title,
        .card-text {
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
            justify-content: space-around;
            padding: 1rem;
            margin-bottom: 1.5rem;
            margin-right: 1rem;
            border: 1px solid #dee2e6;
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #007bff;
        }

        a {
            color: black;
            text-decoration: none !important;
        }

        a:hover {
            text-decoration: underline;
        }

        .room-title {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            margin-top: 1rem;
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

        .tab button:hover {}

        .tab button.active {}

        .tabcontent {
            display: none;
        }

        .club-choose {
            list-style: none;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-around;
        }

        .body-btn {
            text-decoration: none;
            border: 1px solid silver;
            border-radius: 10px;
            color: black;
            padding: 10px;
        }

        .clublistimage {
            height: 450px;
        }

        .clublistimage img {
            max-width: 100%;
            max-height: 100%;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content : space-between;
        }

        .default-image {
            background-image: url("/resources/images/MAVlogo.png");
            max-width: 100%;
            max-height: 100%;
        }

        .card-1 img {
            height: 180px;
            width: 230px;
            margin-bottom: 15px;
            margin-top: 10px;
        }

        .clubCount {
            background-color: #3a4ca8;
            padding: 1px;
            border-radius: 5px;
            color: white;
            width: 80px;
        }

        .clubPoint {
            background-color: #fd9f28;
            padding: 1px;
            border-radius: 5px;
            color: white;
            width: 80px;
        }
    </style>
</head>

<body>
    <jsp:include page="./section/nav.jsp" />
    <div class="main-container">
        <c:choose>
		    <c:when test="${empty adminImages}">
		       <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		            <div class="carousel-inner">
		                <div class="carousel-item active">
		                    <img src="<c:url value='/resources/images/MAVlogo.png'/>"
		                    class="d-block w-100" alt="첫 번째 슬라이드" style="width: 100%; height: 700px;">
		                </div>
		                <div class="carousel-item">
		                    <img src="<c:url value='/resources/images/MAVlogo.png' />"
		                    class="d-block w-100" alt="두 번째 슬라이드" style="width: 100%; height: 700px;">
		                </div>
		                <div class="carousel-item">
		                    <img src="<c:url value='/resources/images/MAVlogo.png'/>"
		                    class="d-block w-100" alt="세 번째 슬라이드" style="width: 100%; height: 700px;">
		                </div>
		            </div>
		            <!-- 이전/다음 화살표 -->
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
		    </c:when>
		    <c:otherwise>
		    	   <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		            <div class="carousel-inner">
		                <div class="carousel-item active">
		                    <img src="<c:url value='/resources/images/${adminImages.mainslideImageName1}' />"
		                    class="d-block w-100" alt="첫 번째 슬라이드" style="width: 100%; height: 700px;">
		                </div>
		                <div class="carousel-item">
		                    <img src="<c:url value='/resources/images/${adminImages.mainslideImageName2}' />"
		                    class="d-block w-100" alt="두 번째 슬라이드" style="width: 100%; height: 700px;">
		                </div>
		                <div class="carousel-item">
		                    <img src="<c:url value='/resources/images/${adminImages.mainslideImageName3}' />"
		                    class="d-block w-100" alt="세 번째 슬라이드" style="width: 100%; height: 700px;">
		                </div>
		            </div>
		            <!-- 이전/다음 화살표 -->
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
		    </c:otherwise>
		</c:choose>
        <div class="main col-12">
            <div class="col-12">
                <div class="room-title">
                    <h2>신규 동호회</h2>
                </div>
                <div class="card-container">
                    <c:set var="count" value="0" />
                    <c:forEach items="${club}" var="club">
                        <c:if test="${count < 5}">
                            <div class="card-1" style="width: 18rem;">
                                <a href="<c:url value=" /MAV/club/clubinfo" />?clubName=${club.clubName}">
                                <img class="card-img-top" src="<c:url value="/resources/images/${club.imageFileName1}" />" onerror="this.classList.add('default-image');" />
                                <div class="card-body">
                                    <h5 class="card-title">${club.clubName}</h5>
                                    <div class="d-flex" style="justify-content : space-around; ">
                                        <p class="card-text clubCount mt-3 mb-3">M.${club.clubMemberCount}</p>
                                        <p class="card-text clubPoint mt-3 mb-3">P.${club.clubPoint}</p>
                                    </div>
                                    <p class="card-text clubCategory">동호회 종류 : ${club.clubCategory}</p>
                                    <p class="card-text clubLocale">동호회 지역 : ${club.clubLocale}</p>
                                </div>
                                </a>
                            </div>
                            <c:set var="count" value="${count + 1}" />
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- 매칭룸 -->
        <div class="list-container col-12">
            <div class="my-3 p-3 bg-body rounded shadow" style="width: 48%; border-radius: 15px; border:1px solid rgb(221, 223, 237);
				">
                <h6 class="border-bottom pb-2 mb-0 fw-bold innershadow">
                    <i class="fa-solid fa-fire">&nbsp;</i></i> Matching Room
                </h6>
                <div class="d-flex text-body-secondary pt-3 col-md-12 row">
                    <c:forEach var="matchView" items="${matchView}">
                        <c:if test="${matchView.matched == 1}">

                            <div class="d-flex matchlist">
                                <div class="d-flex small lh-sm w-100 matchinfo" style="margin-left: 20px;">
                                    <div>
                                        <b>
                                            <h4 class="d-block">${matchView.roomTime}</h4>
                                        </b>
                                    </div>
                                    <div style="margin-left: 15px">
                                        <strong class="text-gray-dark">
                                            <h5 class="mb-2">
                                                <b>${matchView.roomName}</b>
                                            </h5>
                                        </strong> <b><span class="d-block">${matchView.roomDate}</span></b>
                                    </div>
                                </div>
                                <div class="col-1" style="width: auto;">
                                    <a href="./match/matchingDetail?roomNum=${matchView.roomNum}" class="room-application-btn4">매치신청</a>
                                </div>
                            </div>
                            <hr>
                        </c:if>
                    </c:forEach>
                </div>
                <small class="d-block text-end mt-3"> <a href="match/matchingView" class="btn btn-secondary" style="margin-right: 24px">모두보기</a>
                </small>
            </div>
            <!-- 경기장 -->
            <div class="my-3 p-3 bg-body rounded shadow" style="width: 48%; border-radius: 15px; border:1px solid rgb(221, 223, 237);
				">
                <h6 class="border-bottom pb-2 mb-0 fw-bold innershadow2">
                    <i class="fa-solid fa-calendar-days"></i>&nbsp;</i></i> Field
                </h6>
                <div class="d-flex text-body-secondary pt-3 col-md-12 row">
                    <c:forEach var="myRooms" items="${myRooms}">
                        <c:if test="${myRooms.matched == 0}">
                            <div class="d-flex matchlist">
                                <div class="d-flex small lh-sm w-100 matchinfo" style="margin-left: 20px;">
                                    <div>
                                        <b>
                                            <h4 class="d-block">${myRooms.roomTime}</h4>
                                        </b>
                                    </div>
                                    <div style="margin-left: 15px">
                                        <strong class="text-gray-dark">
                                            <h5 class="mb-2">
                                                <b>${myRooms.roomName}</b>
                                            </h5>
                                        </strong> <b><span class="d-block">${myRooms.roomDate}</span></b>
                                    </div>
                                </div>
                                <div class="col-1" style="width: auto;">
                                    <a href="./match/roomsDetail?roomNum=${myRooms.roomNum}" class="room-application-btn4">경기장 보기</a>
                                </div>
                            </div>
                            <hr>
                        </c:if>
                    </c:forEach>
                </div>
                <small class="d-block text-end mt-3"> <a href="room/roomView" class="btn btn-secondary" style="margin-right: 24px">모두보기</a>
                </small>
            </div>

        </div>
    </div>
    <jsp:include page="./section/footer.jsp" />
</body>
</html>