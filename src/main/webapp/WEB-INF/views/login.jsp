<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDate"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
   crossorigin="anonymous">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
   crossorigin="anonymous"></script>
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
   rel="stylesheet">
<style>
	* {
	   font-family: 'Noto Sans KR', sans-serif;
	}
	.main-container {
	   width: 80%;
	   margin: 0 auto;
	}
	.main-logo
	{
		width: 100%;
		margin : 0 auto;
		text-align: center;
		margin-top: 90px;
	}
	.wrap {
	   display: flex;
	   justify-content: center;
	   height: auto;
	   margin-top: 30px;
	}
	
	.login {
	   background: #fff;
	   padding: 20px;
	   border-radius: 10px;
	   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	   border:1px solid silver;
	   width: 40%;
	   height: 150%;
	}
	
	h2, h4 {
	   color: #333;
	}
	
	input[type="text"], input[type="password"] {
	   width: 100%;
	   border: none;
	   border-bottom: 1px solid #4B70E2;
	   margin-bottom: 20px;
	}
	
	.submit {
	   text-align: center;
	}
	
	.submit input[type="submit"] {
	   border: none;
	   background: #4B70E2;
	   color: #fff;
	   padding: 10px 20%;
	   border-radius: 5px;
	   cursor: pointer;
	}
</style>
</head>
<body>
<jsp:include page="./section/nav.jsp" />
  <div class="main-logo">
  	<img src="<c:url value="/resources/images/MAVlogo.png"/>" style="width: 20%;">
  </div>
   <div class="main-container">
      <div class="wrap">
         <div class="login col-6 col-md-3">
            <h2>Log-in</h2>
            <br>
            <div class="login_sns"></div>
            <form:form modelAttribute="member" action="./login" method="post">
               <div class="login_id">
                  <h4>ID</h4>
                  <form:input type="text" class="form-control" path="memberId" />
               </div>
               <div class="login_pw">
                  <h4>Password</h4>
                  <form:input type="password" class="form-control"
                     path="memberPassword" />
               </div>
               <div class="login_etc">
                  <div class="checkbox"></div>
                  <div class="forgot_pw"></div>
               </div><br>
               <div class="submit">
                  <input type="submit" value="로그인">
               </div>
            </form:form>
         </div>
      </div>
   </div>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      

</body>
</html>