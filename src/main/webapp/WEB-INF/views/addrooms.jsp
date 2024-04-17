<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>경기장 등록</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.container {
	width: 80vw;
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
	<br>
	<br>
	<br>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">경기장 등록</h4>
				<form:form modelAttribute="newrooms" class="validation-form"
					method="post"
					action="${pageContext.request.contextPath}/room/addrooms"
					onsubmit="return validateForm()">
					<label for="">구장이름</label>
					<form:input path="roomName" name="roomName" class="form-control" />
					<div class="invalid-feedback" id="roomCountFeedback">최대 참가인원을
						입력해주세요</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="">경기날짜</label>
							<form:input type="date" path="roomDate" name="roomDate"
								class="form-control" min="<%=LocalDate.now()%>" />
							<div class="invalid-feedback" id="roomDateFeedback">경기날짜를
								입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="" class="form-label">경기시간</label>
							<form:input type="time" path="roomTime" name="roomTime"
								class="form-control" />
							<div class="invalid-feedback" id="roomTimeFeedback">경기시간을
								입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="">수용인원</label>
							<form:input type="number" path="roomCapacity" name="roomCapacity"
								class="form-control" />
							<div class="invalid-feedback" id="roomCapacityFeedback">
								수용인원을 입력해주세요</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="">경기종목</label>
							<form:input type="text" path="roomCategory" name="roomCategory"
								class="form-control" />
							<div class="invalid-feedback" id="roomCategoryFeedback">
								셀렉트하게 만들기</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="">최대 참가인원</label>
							<form:input type="number" path="roomCount" name="roomCount"
								class="form-control" />
							<div class="invalid-feedback" id="roomCountFeedback">최대
								참가인원을 입력해주세요</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="">세부사항을 입력해주세요.<span class="text-muted">&nbsp;(필수
								아님)</span></label>
						<form:textarea type="text" id="myTextArea"
							oninput="handleInput(event)" class="form-control"
							path="roomDetail" name="roomDetail" rows="10"
							style="height: 50vh;" />
					</div>
					<div class="mb-4"></div>
					<input type="submit" value="경기 등록하기" class="room-application-btn4">
				</form:form>
			</div>
		</div>
	</div>
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

			const roomDateFeedback = document
					.getElementById('roomDateFeedback');
			const roomTimeFeedback = document
					.getElementById('roomTimeFeedback');
			const roomCapacityFeedback = document
					.getElementById('roomCapacityFeedback');
			const roomCategoryFeedback = document
					.getElementById('roomCategoryFeedback');
			const roomCountFeedback = document
					.getElementById('roomCountFeedback');

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
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXBcSRQHD92K3e5bIM1QQOOy1L1lOBg/nSk"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>

</html>