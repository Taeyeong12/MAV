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
    <title>상세 페이지</title>

    <script src="https://kit.fontawesome.com/1a6288a620.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .main-container {
            width: 80%;
            margin: 0 auto;
        }

        .carousel-inner {
            margin-top: 20px;
            margin-bottom: 20px;
            width: 100%
        }

        .carousel-inner img {
            width: 100%;
            height: 65vh;
            object-fit: cover;
        }

        .detail-box {
            padding: 1rem;
            margin-bottom: 2rem;
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

        .tiny {
            font-size: xx-small;
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
    <div class="main-container">
        <div class="container">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://static.nike.com/a/images/w_1920,c_limit,f_auto,q_auto/918325cf-fc65-4f3a-8d61-89495fc985d2/image.png" class="d-block w-100" alt="첫 번째 슬라이드">
                    </div>
                    <div class="carousel-item active">
                        <img src="https://static.nike.com/a/images/w_1920,c_limit,f_auto,q_auto/918325cf-fc65-4f3a-8d61-89495fc985d2/image.png" class="d-block w-100" alt="첫 번째 슬라이드">
                    </div>
                    <div class="carousel-item active">
                        <img src="https://static.nike.com/a/images/w_1920,c_limit,f_auto,q_auto/918325cf-fc65-4f3a-8d61-89495fc985d2/image.png" class="d-block w-100" alt="첫 번째 슬라이드">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="detail-row d-flex">
                <div class="detail-left">
                    <div class="detail-box">
                        <h1>${detailroom.roomName}</h1>
                        <p>참가인원 : ${detailroom.roomCount}&nbsp;&nbsp;&nbsp;&nbsp;
                            수용인원 : ${detailroom.roomCapacity}</p>
                    </div>
                    <div class="detail-box">
                        <h2>상세내용</h2>
                        <pre>${detailroom.roomDetail}</pre>
                    </div>
                </div>
                <div class="detail-right" style="position: relative;">
                    <div class="detail-box" style="height: 25rem;">
                        <b>
                            <p>
                                RoomDate :<b>
                                    <p><b><i class="fa-solid fa-calendar-days"></i> ${detailroom.roomDate}<br><i class="fa-solid fa-clock"></i> ${detailroom.roomTime}</p>

                                    <form:form modelAttribute="matchForm" action="${pageContext.request.contextPath}/match/roomsDetail" method="post">
                                        <div id="matching_bt">
                                            <span>방제 :</span><br>
                                            <form:input path="matchTitle" class="form-control" />
                                            <form:hidden path="roomNum" value="${detailroom.roomNum}" />
                                            <!-- 추가적인 데이터 필드들을 여기에 추가 -->
                                            <br> <label for="clubSelect">동호회 :</label><br> <select name="selectedClub" id="clubSelect" class="form-control form-select text-center">
                                                <c:forEach var="club" items="${memberClubs}">
                                                    <option value="none">==== 동호회 선택하기 ====</option>
                                                    <option value="${club.clubName}">${club.clubName}</option>
                                                </c:forEach>
                                            </select><br>
                                            <button type="submit" class="room-application-btn4 mt-2 float-right" style="position: absolute; right: 20px;">매칭 만들기</button>
                                            <br> <br>
                                            <p class="tiny text-secondary">
                                                <i class="fa-solid fa-triangle-exclamation"></i> 경기는 동호회장만 만들 수
                                                있습니다.
                                        </div>
                                    </form:form>
                    </div>
                    <div class="detail-box additional-info-box" style="height: 30rem;">
                        <div id="map" style="width: 100%; height: 450px; border: 0;"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
    <!-- 카카오  -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=617d72b728b3e792de22e82c5fd893fb"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng($ {
                    coordinate.latitude
                }, $ {
                    coordinate.longitude
                }), // 지도의 중심좌표
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
</body>

</html>

</html>