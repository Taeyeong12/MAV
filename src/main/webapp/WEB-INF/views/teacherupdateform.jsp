<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
   </script>
  </head>
  <% 	
  		String teacher= request.getParameter("teacherId");
  		String update= request.getParameter("teacher");
        System.out.println("update는:"+update);
  		System.out.println("teaherupdate:"+teacher);
  %>
  <body>
  <jsp:include page="./section/nav.jsp" />
    <div class="main-container">
        <div class="container">
            <div class="input-form-backgroud row">
                <div class="input-form col-md-12 mx-auto">
                    <h4 class="mb-3"> 수정</h4>
                    <form:form modelAttribute="update" class="form-horizontal" action="./formupdate?teacherId=${teacher.teacherId}" method="post" enctype="multipart/form-data">
                  <fieldset>
                   <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="teacherCategory">강사종류</label>
                               <form:input path="teacherCategory" class="form-control" value="${teacher.teacherCategory}" name="teacherCategory" />
                             </div>
                            <div class="invalid-feedback">
                                종목을입력해주세요
                            </div>
                         <div class="col-md-6 mb-3">
                            <label for="teacherRecode">강사이력</label>
                            <form:input class="form-control" path="teacherRecode" name="teacherRecode" value="${teacher.teacherRecode}" />
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
                            <div class="mb-3">
            				 	<label for="teacherInfomation">자기소개<span class="text-muted">&nbsp;(필수 아님)</span></label>
            				 	<form:textarea cols="50" rows="5" class="form-control"  path="teacherInfomation" name="teacherInfomation" value="${teacher.teacherInfomation}"/>
         				 	</div>                     
                      
                       <hr class="mb-4">
                       <div class="mb-4"></div> 
                       <div class="d-flex">  
                       		<input class="btn btn-primary btn-lg btn-block room-application-btn4 " style="margin-right : 10px" type="submit" value="수정 완료"/>
                       		<input class="btn btn-danger btn-lg btn-block" type="button" value="취소 하기" onclick="goBack()"/>
                       </div>         
               </div>
               </fieldset>
               </form:form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>