<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .main-container {
            width: 80%;
            margin: 0 auto;
            display: flex;
        }
        .main {
            display: flex;
            padding: 2rem;
        }
        .col-4 {
            margin-right: auto;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border: none;
        }
        .img1 {
            border-radius: 50%;
            width: 50%;
            margin: 0 auto;
        }
        .right, .right-name {
            display: flex;
        }
        .right img {
            width: 30%;
        }
        .card-title, .card-text {
            margin: 0;
        }
        .list-group-item a {
            text-decoration: none;
            color: #212529;
        }
        .list-group-item:hover {
            background-color: #f8f9fa;
        }
        .card-link {
            color: #007bff;
            text-decoration: none;
        }
        .card-link:hover {
            text-decoration: underline;
        }
        .card h5 {
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }
        .card-1 {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 0.5rem;
            margin-top: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #007bff;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .room-title {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            color: #343a40;
        }
        .room-application-btn {
            padding: 0.5rem 1rem;
            background-color: #007bff;
            color: white;
            border-radius: 0.25rem;
            text-decoration: none;
        }
        .room-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .tab {
            overflow: hidden;
        }
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
        }
        .tab button:hover {
        }
        .tab button.active {
        }
        .tabcontent {
            display: none;
        }
        .list {
            padding: 0 30px;
        }
    </style>
</head>
<body>
    <jsp:include page="./section/nav.jsp"/>
    <div class="main-container">
        <div class="container">
            <h2 class="mt-3 mb-3">관리자 페이지</h2>
            <div class="room-title mt-3"><h3>강사 신청 리스트</h3></div>
            <div class="card list" style="width: 100%;">
                <c:forEach items="${teachers}" var="teacher">
                    <div class="card-1">
                        <div class="room-info">
                            <c:choose>
                                <c:when test="${teacher.teacherApprove eq false}">
                                    <span class="room-title">강사 아이디 ${teacher.teacherId}</span>
                                    <span class="room-date">강사 종류 : ${teacher.teacherCategory}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span class="room-application">
                                        <a href="<c:url value='/teacher'/>?teacherId=${teacher.teacherId}" class="room-application-link room-application-btn">강사 상세정보</a>
                                        <a href="<c:url value='/admin/approveTeacher'/>?teacherId=${teacher.teacherId}" class="room-application-link room-application-btn">강사 승인하기</a>
                                    </span>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="room-title mt-3"><h3>업체 신청 리스트</h3></div>
            <div class="card list" style="width: 100%;">
                <c:forEach items="${allstore}" var="store">
                    <div class="card-1">
                        <div class="room-info">
                            <c:choose>
                                <c:when test="${store.storeApprove eq false}">
                                    <span class="room-title">업체 아이디 : ${store.storeId}</span>
                                    <span class="room-date">업체 종류 : ${store.storeCategory}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span class="room-application">
                                        <a href="<c:url value='/store'/>?storeId=${store.storeId}" class="room-application-link room-application-btn">업체 상세정보</a>
                                        <a href="<c:url value='/admin/approveStore'/>?storeId=${store.storeId}" class="room-application-link room-application-btn">업체 승인</a>
                                    </span>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="room-title mt-3"><h3>강의 신청 리스트</h3></div>
            <div class="card list" style="width: 100%;">
                <c:forEach items="${allclasses}" var="classes">
                    <div class="card-1">
                        <div class="room-info">
                            <c:choose>
                                <c:when test="${classes.classApprove eq false}">
                                    <span class="room-title">강사 아이디 : ${classes.classId}</span>
                                    <span class="room-date">강의명 : ${classes.className}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span class="room-application">
                                        <a href="<c:url value='/Class/detailclass'/>?classNum=${classes.classNum}" class="room-application-link room-application-btn">강의 상세정보</a>
                                        <a href="<c:url value='/admin/approveClasses'/>?classNum=${classes.classNum}" class="room-application-link room-application-btn">강의 승인하기</a>
                                    </span>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <a href="./adminImages" class="btn btn-primary">이미지 등록</a>
            <a href="./Imagesupdate" class="btn btn-primary">이미지 변경</a>
        </div>
    </div>
</body>
</html>