<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>강의등록 - Bootstrap</title>

  <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }


    .container{
     width: 80%;
     margin: 0 auto;
    }
  </style>
</head>

<body>
 <jsp:include page="./section/nav.jsp"/>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">이미지 수정</h4>       
	        <form:form modelAttribute="adminImages" class="validation-form"  method="post" action="/MAV/admin/Imagesupdate" enctype="multipart/form-data">
		        <div class="row">
			        <div class="col-md-6 mb-3">
			            <label for="mainslideImage1" class="form-label">메인 사진1</label>
			            <form:input class="form-control" type="file" path="mainslideImage1"/>
			        </div>
			        <div class="col-md-6 mb-3">
			            <label for="mainslideImage2" class="form-label">메인 사진2</label>
			            <form:input class="form-control" type="file" path="mainslideImage2"/>
			        </div>
			        <div class="col-md-6 mb-3">
			            <label for="mainslideImage3" class="form-label">메인 사진3</label>
			            <form:input class="form-control" type="file" path="mainslideImage3"/>
			        </div>
			        <div class="col-md-6 mb-3">
			            <label for="clublistImage" class="form-label">동호회 리스트 사진</label>
			            <form:input class="form-control" type="file" path="clublistImage"/>
			        </div>
			        <div class="col-md-6 mb-3">
			            <label for="classlistImage" class="form-label">강의 리스트 사진</label>
			            <form:input class="form-control" type="file" path="classlistImage"/>
			        </div>
				</div>
		        <input class="btn btn-primary btn-lg btn-block" type="submit" value="사진 등록"/>                       
	        </form:form>
               </div>
           </div>
       </div>
	   
 </body>
</html>