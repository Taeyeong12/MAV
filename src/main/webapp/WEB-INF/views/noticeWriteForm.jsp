<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDate" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

	<script src="https://kit.fontawesome.com/1a6288a620.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
	.main-container
	{
		width : 80%;
		margin : 0 auto;
	}


.input-form-backgroud {
	padding: 2px;
	margin-top: 30px;
	border : 1px solid #d3d3d3;
	border-radius: 5px;
}

.input-form {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 5px;
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
<div class="">
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">게시글 작성</h4>
            
            <form action="./write" method="post">
                <label for="">이름</label>
                <span>세션에서 읽어들인 이름</span><br>                
                <label for="noticeTitle">제목 : </label>
                <input type="text" id="noticeTitle" name="noticeTitle" placeholder="제목" class="form-control" /><br>
                
                <label for="noticeContents">내용 : </label>
                <textarea id="noticeContents" name="noticeContents" cols="30" rows="10" placeholder="내용을 입력하세요" class="form-control"></textarea><br>
                
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                
                <input type="submit" value="등록하기" class="btn btn-primary">
            </form>
        </div>
    </div>
</div>
</div>
</body>

</html>