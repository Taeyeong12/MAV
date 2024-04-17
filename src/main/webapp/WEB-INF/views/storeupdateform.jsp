<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업체 정보 수정</title>

    <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
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
        .row
        {
        	align-items : center;  
        }
    </style>
</head>

<body>
<jsp:include page="./section/nav.jsp" />
	<div class="container">
	    <div class="input-form-backgroud row">
	        <div class="input-form col-md-12 mx-auto">
	            <h4 class="mb-3">업체 수정</h4>
	            <form:form modelAttribute="store" class="validation-form" method="post"  onsubmit="return validateForm()" enctype="multipart/form-data">
	                
	                <!-- CSRF 토큰 추가 -->
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                
	                <label for="">업체명</label>
             		<form:input  path="storeName" class="form-control" value="${store.storeName}"/>
	                <!-- 수정 대상 storeNum -->
	                <input type="hidden" value="${store.storeId}"/>
	                
	                <!-- 업체주소 입력 -->
	                <div class="row">
	                    <div class="col-md-6 mb-3">
	                        <label for="storeAddr">업체주소</label>
	                        <form:input path="storeAddr"  class="form-control"
	                            value="${store.storeAddr}" />
	                        <div class="invalid-feedback" id="storeAddr">업체주소를 입력해주세요.</div>
	                    </div>
	
	                    <!--사업자번호 입력 -->
	                   <div class="col-md-6 mb-3">
	              			<label for="storeCode" class="form-label">사업자번호</label>
	              			<form:input path="storeCode"  class="form-control"  value="${store.storeCode}"/>
            		   </div>
	                </div>
	               
							
	                <!-- 업체번호 입력 -->
	                <div class="row">
	                    <!-- 업체연락처 입력 -->
               		    <div class="col-md-2 mb-3">
                           	<label for="storePhone01">업체번호</label>
                           	<form:input class="form-control"  path="storePhone01" value="${store.storePhone01}"/>	                            
                       	</div>
                       	<div class="col-md-2 mb-2">
                           	<label for="storePhone02"></label>
                           	<form:input class="form-control" path="storePhone02" value="${store.storePhone02}"/>
                       	</div>
                       	<div class="col-md-2 mb-2">
                           	<label for="storePhone03"></label>
                           	<form:input class="form-control"  path="storePhone03" value="${store.storePhone03}" />
                       	</div>

					 
	                    <!-- 경기 종목 입력 -->
	                    <div class="col-md-6 mb-3">
	                        <label for="storeCategory">경기종목</label>
	                        <form:input type="text" path="storeCategory" id="storeCategory" name="storeCategory"
	                            class="form-control" value="${store.storeCategory}" />
	                        <div class="invalid-feedback" id="storeCategory"></div>
	                    </div>
	               </div>
	
	                <!-- 세부사항 입력 -->
	                <div class="mb-3">
	                    <label for="storeInfomation">세부사항을 입력해주세요.<span class="text-muted">&nbsp;(필수 아님)</span></label>
						<textarea class="form-control" id="storeInfomation" name="storeInfomation" rows="10" style="height: 50vh">${store.storeInfomation}</textarea>
	                </div>
	               <!-- 이미지 관련  --> 
	                <div class="row">
		                <div class="col-md-6 mb-3">
				            <label for="storeImage1" class="form-label">대표사진</label>
				            <form:input class="form-control" type="file" path="storeImage1"/>
				        </div>
				        <div class="col-md-6 mb-3">
				            <label for="storeImage2" class="form-label">업체사진</label>
				           <form:input class="form-control" type="file" path="storeImage2"/>
				        </div>
				        <div  class="col-md-6 mb-3">
				            <label for="storeImage3" class="form-label">업체사진</label>
				           <form:input class="form-control" type="file" path="storeImage3"/>
				        </div>
				        <div  class="col-md-6 mb-3">
				            <label for="storeImage4" class="form-label">업체사진</label>
				            <form:input class="form-control" type="file" path="storeImage4"/>
				        </div>
				         <div  class="col-md-6 mb-3">
				            <label for="storeImage5" class="form-label">업체사진</label>
				            <form:input class="form-control" type="file" path="storeImage5"/>
				        </div>
			        </div>
	                <!-- 업체공지사항 -->
	                <div class="mb-3">
	                    <label for="storeNotice">공지사항을 입력해주세요.<span class="text-muted">&nbsp;(필수 아님)</span></label>
						<textarea class="form-control" id="storeNotice" name="storeNotice" rows="10" style="height: 10vh">${store.storeNotice}</textarea>
	                </div>
	
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>
