<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경기장 등록</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">

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
                <h4 class="mb-3">토너먼트 등록</h4>

				<form:form modelAttribute="updateTournament" class="validation-form" method="post"
				           action="${pageContext.request.contextPath}/tournament/updateTournament" onsubmit="return validateForm()">
				    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="tournamentNum" value="${updateTournament.tournamentNum}">
				    <div class="row">
				        <!-- 경기날짜 -->
				        <div class="col-md-6 mb-3">
				            <label for="">경기날짜</label>
				            <form:input type="date" path="tournamentDate" name="tournamentDate" class="form-control" value="${updateTournament.tournamentDate}"/>
				            <div class="invalid-feedback" id="tournamentDateFeedback">
				                경기날짜를 입력해주세요.
				            </div>
				        </div>
				        <!-- 경기시간  -->
				        <div class="col-md-6 mb-3">
				            <label for="" class="form-label">경기 시간</label>
				            <form:input type="time" path="tournamentTime" name="tournamentTime" class="form-control" value="${updateTournament.tournamentTime}"/>
				            <div class="invalid-feedback" id="tournamentRewardFeedback">
				                경기시간을 입력해주세요.
				            </div>
				        </div>
				    </div>
				    <!-- 상금  -->
				    <div class="row">
				        <div class="col-md-6 mb-3">
				            <label for="">상금</label>
				            <form:input type="number" path="tournamentReward" name="tournamentReward" class="form-control"  value="${updateTournament.tournamentReward}"/>
				            <div class="invalid-feedback" id="tournamentRewardFeedback">
				                상금을 입력해주세요
				            </div>
				        </div>
				        <!-- 참가비  -->
				        <div class="col-md-6 mb-3">
				            <label for="">참가비</label>
				            <form:input type="number" path="tournamentPrice" name="tournamentPrice" class="form-control" value="${updateTournament.tournamentPrice}"/>
				            <div class="invalid-feedback" id="tournamentPriceFeedback">
				                <!-- 셀렉트하게 만들기 -->  
				            </div>
				        </div>
				    </div>
				    <div class="row form-group">
				        <!-- 셀렉트 필드  -->
				        <label class="row" for="max_participants">참가 팀 수:</label>
				        <select name="max_participants" th:field="${updateTournament.max_participants}">
				            <option value="" disabled>선택하세요</option>
				            <option value="4">4</option>
				            <option value="6">6</option>
				            <option value="8">8</option>
				            <option value="10">10</option>
				            <option value="12">12</option>
				            <option value="14">14</option>
				            <option value="16">16</option>
				            <option value="18">18</option>
				            <option value="20">20</option>
				            <option value="22">22</option>
				            <option value="24">24</option>
				            <option value="26">26</option>       
				        </select>
				    </div>
	    			<div class="mb-4"></div>
                    <input type="submit" value="토먼먼트 수정하기" class="btn btn-danger" >
				</form:form>

			          
			          <!-- 내일 할것  -->
	<%-- 			           <div class="mb-3">
			            <label for="">세부사항을 입력해주세요.<span class="text-muted">&nbsp;(필수 아님)</span></label>
					 <form:textarea type="text" id="myTextArea"  oninput="handleInput(event)" class="form-control" path="roomDetail" name="roomDetail" rows="10" style="height: 50vh;"/>
			                    </div>
			                    <div class="mb-4"></div>
			                    <input type="submit" value="경기 등록하기" class="btn btn-primary">
			             </form:form> --%>
	            </div>
	        </div>
	    </div>
     -->    
 <script>
 
	function handleInput(event) {
	     if (event.inputType === 'insertParagraph') {
	         var textarea = document.getElementById('myTextArea');
	         textarea.value += '\r\n';
	     }
	}
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>
