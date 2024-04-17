<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }


    .container
    {
     width: 80%;
     margin: 0 auto;
     margin-top : 20px;
    }
  </style>
</head>

 <body>
 <jsp:include page="./section/nav.jsp"/>
       <div class="container">
           <div class="input-form-backgroud row">
               <div class="input-form col-md-12 mx-auto">
                   <h4 class="mb-3">강사 가입</h4>
                   <form:form modelAttribute="addTeacher" class="form-horizontal" action="/MAV/teacher/add" method="post" enctype="multipart/form-data">

               <fieldset>
                <div class="row">
                         <div class="col-md-6 ">
                             <label for="teacherCategory">강사종류</label>
                             <form:hidden class="form-control" path="teacherId" value="${member.memberId}"/>
                             
                            <form:input path="teacherCategory" class="form-control" name="teacherCategory"/>                          
                          </div>
                        <div class="invalid-feedback">
                            전공을 입력해주세요
                        </div>                    
                        <div class="col-md-6 ">
                            <label for="teacherRecode">강사이력</label>
                            <form:input class="form-control" path="teacherRecode" name="teacherRecode"/>
                        </div>
                        <div class="invalid-feedback">
                              강사이력을 입력해주세요.
                        </div>  
                        <div class="col-md-12">
           				 	<label for="teacherInfomation">강사소개<span class="text-muted">&nbsp;(필수 아님)</span></label>
           					<form:textarea cols="50" rows="5" class="form-control" path="teacherInfomation" name="teacherInfomation"/>
           			   </div>
                     
                       <div class="row">
			                <div class="col-md-6 mb-3">
			                    <label for="teacherLicense1" class="form-label">강사자격증</label>
			                    <form:input class="form-control" type="file" path="teacherLicense1"/>
			                </div>
			                <div class="col-md-6 mb-3">
			                    <label for="teacherLicense2" class="form-label">강사자격증</label>
			                   <form:input class="form-control" type="file" path="teacherLicense2"/>
			                </div>
			                <div  class="col-md-6 mb-3">
			                    <label for="teacherLicense3" class="form-label">강사자격증</label>
			                   <form:input class="form-control" type="file" path="teacherLicense3"/>
			                </div>
			                <div  class="col-md-6 mb-3">
			                    <label for="teacherLicense4" class="form-label">강사자격증</label>
			                    <form:input class="form-control" type="file" path="teacherLicense4"/>
			                </div>
    			             <div  class="col-md-6 mb-3">
			                    <label for="teacherLicense5" class="form-label">강사자격증</label>
			                    <form:input class="form-control" type="file" path="teacherLicense5"/>
			                </div>
			                   <div  class="col-md-6 mb-3">
			                    <label for="teacherImages" class="form-label">강사사진</label>
			                    <form:input class="form-control" type="file" path="teacherImages"/>
			                </div>
           				 </div>
         				 
                            
            </div>
                   <br>
                    <hr class="mb-4">
                    <div class="mb-4"></div>   
                      <input class="btn btn-primary btn-lg btn-block" type="submit" value="신청 완료"/>            
            </fieldset>
            </form:form>
               </div>
           </div>
       </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
 </body>
</html>