<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .main-container
        {
            width: 80%;
            margin: 0 auto;
        }
        .container
        {
            margin-top: 20px;
        }
        textarea 
        {
		    white-space: pre-line; /* 줄바꿈 유지 */
		    overflow-wrap: break-word; /* 긴 단어 줄 바꿈 */
		    word-wrap: break-word; /* 긴 단어 줄 바꿈 */
		    border: none; /* 테두리 제거 */
		    resize: none; /* 크기 조정 비활성화 */
		    outline: none; /* 외곽선 제거 */
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
		function goBack() 
		{
		    window.history.back();
		}
		window.onload = function() {
		    var textarea = document.getElementsByName('clubInfo')[0];
		    textarea.innerHTML = textarea.innerHTML.replace(/\n/g, '<br>');
		};
	</script>
 <title>동호회 생성</title>
 </head>
 <body>
 <jsp:include page="./section/nav.jsp" />
   <div class="main-container">
       <div class="container">
           <div class="input-form-backgroud row">
               <div class="input-form col-md-12 mx-auto">
                   <h4 class="mb-3">정보 수정</h4>
                   <form:form modelAttribute="club" class="form-horizontal" action="/MAV/club/update?clubNum=${club.clubNum}" method="post" enctype="multipart/form-data">
					<fieldset>
				 	<div class="row">
                        <div class="col-md-7 mb-3">
                       		<label for="clubName">동호회 이름</label>
                         	<form:input path="clubName" class="form-control" />                          
                       	</div>
                        <div class="invalid-feedback">
                            동호회 이름을 입력해주세요.
                        </div>                    
                      	<div class="col-md-6 mb-3">
                            <label for="clubLocale">활동 지역</label>
                            <form:select class="form-select" aria-label="Default select example" path="clubLocale" value="${club.clubLocale}">
                            	<form:options items="${localeOptions}"/>
                            </form:select>
                        </div>
                        <div class="invalid-feedback">
                            지역을 입력해주세요.
                        </div>                 
                        <div class="col-md-6 mb-3">
                            <label for="clubCategory">활동 종류</label>
                            <form:select class="form-select" aria-label="Default select example" path="clubCategory">
                                <form:options items="${categoryOptions}"/>
                            </form:select>
                        </div>
                        <div class="col-md-7 mb-3">
                       		<label for="clubImages1">대표 사진</label>
                         	<form:input type="file" path="clubImages1" class="form-control" value="${club.imageFileName1}"/>                          
                       	</div>
                       	<div class="col-md-7 mb-3">
                       		<label for="clubImages2">동호회 사진1</label>
                         	<form:input type="file" path="clubImages2" class="form-control" value="${club.imageFileName2}"/>                          
                       	</div>     
                       	<div class="col-md-7 mb-3">
                       		<label for="clubImages3">동호회 사진2</label>
                         	<form:input type="file" path="clubImages3" class="form-control" value="${club.imageFileName3}"/>                          
                       	</div>     
                       	<div class="col-md-7 mb-3">
                       		<label for="clubImages4">동호회 사진3</label>
                         	<form:input type="file" path="clubImages4" class="form-control" value="${club.imageFileName4}"/>                          
                       	</div>     
                       	<div class="col-md-7 mb-3">
                       		<label for="clubImages5">동호회 사진4</label>
                         	<form:input type="file" path="clubImages5" class="form-control" value="${club.imageFileName5}"/>                          
                       	</div>                                            
                        <div class="col-md-12 mb-3">
                            <label for="clubInfo">동호회 소개글</label>
                            <form:textarea class="form-control" path="clubInfo" />                        
                        </div>
                	</div>
                	<br>
                    <hr class="mb-4">
                    <div class="mb-4"></div>	
                   	<input class="room-application-btn4 btn-lg btn-block" type="submit" value="수정 완료"/>
                   	<input class="room-application-btn4 btn-lg btn-block" type="button" value="취소 하기" onclick="goBack()"/>				
				</fieldset>
				</form:form>
               </div>
           </div>
       </div>
   </div>
 </body>
</html>