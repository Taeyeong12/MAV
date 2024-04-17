<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경기장 정보 수정</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }

        .input-form-backgroud {
            background-color: #f8f9fa;
            padding: 20px;
            margin-top: 30px;
            border-radius: 10px;
        }

        .input-form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .mb-4 {
            margin-bottom: 4rem;
        }

        .validation-form {
            position: relative;
        }

        .invalid-feedback {
            display: none;
            color: #dc3545;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>

<body>
	<jsp:include page="./section/nav.jsp" />
	<div class="container">
	    <div class="input-form-backgroud row">
	        <div class="input-form col-md-12 mx-auto">
	            <h4 class="mb-3">경기장 수정</h4>
	            <form:form modelAttribute="updateRooms" class="validation-form" method="post"
	                action="${pageContext.request.contextPath}/room/roomsChange" onsubmit="return validateForm()">
	                <!-- CSRF 토큰 추가 -->
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                
	                <label for="">구장이름</label>
             		<form:input  path="roomName" name="roomName" class="form-control" value="${updateRooms.roomName}"/>
	                <!-- 수정 대상 roomNum -->
	                <input type="hidden" name="roomNum" value="${updateRooms.roomNum}">
	                
	                <!-- 경기 날짜 입력 -->
	                <div class="row">
	                    <div class="col-md-6 mb-3">
	                        <label for="roomDate">경기날짜</label>
	                        <form:input path="roomDate" id="roomDate" name="roomDate" class="form-control"
	                            value="${updateRooms.roomDate}" />
	                        <div class="invalid-feedback" id="roomDateFeedback">경기날짜를 입력해주세요.</div>
	                    </div>
	
	                    <!-- 경기 시간 입력 -->
	                    <div class="col-md-6 mb-3">
	                        <label for="roomTime" class="form-label">경기시간</label>
	                        <form:input path="roomTime" id="roomTime" name="roomTime" class="form-control"
	                            value="${updateRooms.roomTime}" />
	                        <div class="invalid-feedback" id="roomTimeFeedback">경기시간을 입력해주세요.</div>
	                    </div>
	                </div>
	
	                <!-- 수용 인원 입력 -->
	                <div class="row">
	                    <div class="col-md-6 mb-3">
	                        <label for="roomCapacity">수용인원</label>
	                        <form:input type="number" path="roomCapacity" id="roomCapacity" name="roomCapacity"
	                            class="form-control" value="${updateRooms.roomCapacity}" />
	                        <div class="invalid-feedback" id="roomCapacityFeedback">수용인원을 입력해주세요</div>
	                    </div>
	
	                    <!-- 경기 종목 입력 -->
	                    <div class="col-md-6 mb-3">
	                        <label for="roomCategory">경기종목</label>
	                        <form:input type="text" path="roomCategory" id="roomCategory" name="roomCategory"
	                            class="form-control" value="${updateRooms.roomCategory}" />
	                        <div class="invalid-feedback" id="roomCategoryFeedback">셀렉트하게 만들기</div>
	                    </div>
	                </div>
	
	                <!-- 최대 참가 인원 입력 -->
	                <div class="row">
	                    <div class="col-md-6 mb-3">
	                        <label for="roomCount">최대 참가인원</label>
	                        <form:input type="number" path="roomCount" id="roomCount" name="roomCount"
	                            class="form-control" value="${updateRooms.roomCount}" />
	                        <div class="invalid-feedback" id="roomCountFeedback">최대 참가인원을 입력해주세요</div>
	                    </div>
	                </div>
	
	                <!-- 세부사항 입력 -->
<!-- 세부사항 입력 -->
                   <div class="mb-3">
                       <label for="roomDetail">세부사항을 입력해주세요.<span class="text-muted">&nbsp;(필수 아님)</span></label>
                  <textarea class="form-control" id="roomDetail" name="roomDetail" rows="10" style="height: 50vh">${updateRooms.roomDetail}</textarea>
                   </div>
               		<input type="hidden" name="storeId" value="${store.storeId}"/>	
	                <!-- 수정하기 버튼 -->
	                <div class="mb-4">
	                    <input type="submit" value="수정하기" class="btn btn-primary">
	                </div>
	            </form:form>
	        </div>
	    </div>
	</div>
 <script>
    function validateForm() {
        const roomDateInput = document.getElementById('roomDate');
        const roomTimeInput = document.getElementById('roomTime');
        const roomCapacityInput = document.getElementById('roomCapacity');
        const roomCategoryInput = document.getElementById('roomCategory');
        const roomCountInput = document.getElementById('roomCount');

        const roomDateFeedback = document.getElementById('roomDateFeedback');
        const roomTimeFeedback = document.getElementById('roomTimeFeedback');
        const roomCapacityFeedback = document.getElementById('roomCapacityFeedback');
        const roomCategoryFeedback = document.getElementById('roomCategoryFeedback');
        const roomCountFeedback = document.getElementById('roomCountFeedback');

        // 입력값이 비어있는지 확인
        if (!roomDateInput.value.trim()) {
            roomDateFeedback.style.display = 'block';
            return false;
        } else {
            roomDateFeedback.style.display = 'none';
        }

        if (!roomTimeInput.value.trim()) {
            roomTimeFeedback.style.display = 'block';
            return false;
        } else {
            roomTimeFeedback.style.display = 'none';
        }

        if (!roomCapacityInput.value.trim()) {
            roomCapacityFeedback.style.display = 'block';
            return false;
        } else {
            roomCapacityFeedback.style.display = 'none';
        }

        if (!roomCategoryInput.value.trim()) {
            roomCategoryFeedback.style.display = 'block';
            return false;
        } else {
            roomCategoryFeedback.style.display = 'none';
        }

        if (!roomCountInput.value.trim()) {
            roomCountFeedback.style.display = 'block';
            return false;
        } else {
            roomCountFeedback.style.display = 'none';
        }

        // 모든 필드가 입력되었을 때 폼 제출
        return true;
    }
  </script>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXBcSRQHD92K3e5bIM1QQOOy1L1lOBg/nSk"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>

</html>
