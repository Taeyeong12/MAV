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
<title>공지사항</title>

<script src="https://kit.fontawesome.com/1a6288a620.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

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
		background-color: rgb(220 220 220);
		padding: 2px;
		margin-top: 30px;
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
		background-color:  rgb(220 220 220);
		border-color:  rgb(220 220 220);
	}
	
	.btn-primary:hover {
		background-color: #0056b3;
		border-color: #0056b3;
	}
	
	.bonmun {
		height: 50vw;
	}
	
	table {
		margin: 0 auto;
		width: 60vw !important; /* 수정: 테이블 너비를 80vw로 조정 */
	}
	
	th, td {
		text-align: center;
	}
	
	.table td, .table th {
		padding: .75rem;
	}
	
	.fa-angle-up, .fa-angle-down {
		display: block;
		margin: 0 auto;
	}
	
	.table_body {
		text-align: right;
	}
	
	/* 새로운 스타일 추가 */
	.text-right2 {
		text-align: right;
	}
	</style>
</head>

<body>
	<jsp:include page="./section/nav.jsp" />
	<div class="">
		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h3 class="mb-4"
						style="border-bottom: 1px solid rgb(220 220 220);">
						<b><span>${detailNotice.noticeTitle}</span>
							</h4>
							<div class="bonmun">
								<p>
								<pre>${detailNotice.noticeContents}</pre>
								</p>
							</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<table class="table ">
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th scope="coltitle" colspan="4" class="text-center">제목</th>
				<th scope="col" colspan="1" class="text-right2">등록일</th>
			</tr>
			<tr>
				<td><i class="fa-solid fa-angle-up" colspan=""></i></td>
				<td></td>
				<td></td>
			   <td colspan="4">
			       <c:choose>
			           <c:when test="${not empty nextNotice.noticeTitle}">
			               <a href="<c:url value='/notice/noticeDetail'/>?noticeNum=${nextNotice.noticeNum}" class="text-dark">${nextNotice.noticeTitle}</a><span style="color: red;">(${nextNotice.noticeHits})</span>
			           </c:when>
						<c:otherwise >
				               <div style="color: rgb(220 220 220);">마지막글 입니다.</div>	
			           </c:otherwise>
			       </c:choose>
			   </td>
				<td colspan="1" class="table_body">${nextNotice.noticeDate}</td>
			</tr>
			<tr>
				<td><i class="fa-solid fa-angle-down" colspan=""></td>
				<td></td>
				<td></td>
				<td colspan="4">
				    <c:choose>
				        <c:when test="${not empty previousNotice.noticeTitle}">
				            <a href="<c:url value='/notice/noticeDetail'/>?noticeNum=${previousNotice.noticeNum}" class="text-dark">${previousNotice.noticeTitle}</a><span style="color: red;">(${previousNotice.noticeHits})</span>
				        </c:when>
						<c:otherwise>
							<div style="color: rgb(220 220 220);">이전글이 없습니다.</div>					    
						</c:otherwise>
				    </c:choose>
				</td>
				<td colspan="1" class="table_body">${previousNotice.noticeDate}
				</td>
			</tr>
		</table>
		<div class="row">
			<div class="col-md-9 row "></div>
			<c:choose>
				<c:when test="${member.adminApprove eq true}">
					<a href="./deleteNotice?noticeNum=${detailNotice.noticeNum}" class="col-md-1 text-center btn btn-outline-primary">삭제</a> 
					<a href="./updateForm?noticeNum=${detailNotice.noticeNum}" class="col-md-1 text-center btn btn-outline-primary">수정</a>
				</c:when>
			</c:choose> 
				<a href="./list" class="col-md-1 text-center btn btn-outline-primary">전체보기</a>
		</div>
	</div>
	</body>
</html>