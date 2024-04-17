<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>강사 마이페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
        }

        .main {
            width: 80%;
            margin: 0 auto;
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

    
    </style>
 <script> function openTab(evt, tabName) {
          console.log("opentab실행");
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";}
       </script>
</head>

<body>
    <jsp:include page="./section/nav.jsp" />
    <div class="main">
        <div class="col-4">
            <div class="card" style="width: 100%; background-color: rgb(153, 162, 209);">
                <h5 class="card-title" style="text-align: center; font-size: 1.5rem;">${member.memberName}</h5>
                <div class="card-body">
                    <img src=<c:url value="/resources/images/${teacher.licenseImageFileName1}"/> class="d-block" style="width:150px; border-radius: 50%; border:1px solid red; margin: 0 auto; max-width:100%; max-height:100%; height:150px;" >
                    <p class="card-text" style="text-align: center; font-size: 1.2rem;">${teacher.teacherCategory}</p>
                    <p class="card-text" style="text-align: center; font-size: 1rem;">${member.memberEmail}</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <a href="./Class/addclass">강의등록하기</a>
                    </li>
                    <li class="list-group-item">
                        <a href="./teacher/update/teacher?teacherId=${teacher.teacherId}">강사정보수정</a>
                    </li>
                    <li class="list-group-item">
                        <a href="./teacher/delete?teacherId=${teacher.teacherId}">강사탈퇴</a>
                    </li>                  
                </ul>
            </div>
        </div>
        <div class="col-7">
            <div class="card">
                <h5>개인정보</h5>
                <div class="right">

                    <div class="right-name">
                        <p>${member.memberName}</p> <br>
                        <p>${member.memberEmail}</p>
                    </div>
                </div>
                <hr>
            </div>
            <br>
            <div>
                <div class="room-title">강의관리</div>
                <c:forEach items="${allclass}" var="allclasses">
                    <div class="card-1 mb-3">
                        <div class="room-info">
                            <span class="room-title">&nbsp;&nbsp;${allclasses.classNum} - ${allclasses.className}</span>
                            <span class="room-date">날짜 :${allclasses.classLecturedate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시간 : ${allclasses.classLecturetime}</span>
                            <span class="room-application">
                            <span class="room-application-count">0/1</span> 
                          <a href="<c:url value='/Class/detailclass'/>?classNum=${allclasses.classNum}" class="room-application-link room-application-btn">조회</a>  
                          <a href="<c:url value='/Class/updateclass'/>?classNum=${allclasses.classNum}" class="room-application-link room-application-btn">수정</a>   
                          <a href="<c:url value='/Class/deleteclass'/>?classNum=${allclasses.classNum}" class="room-application-link room-application-btn">삭제</a>   
                            </span>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div>
         </div>                    
    </div>
</div>
                    <img src=<c:url value="/resources/images/${teacher.licenseImageFileName2}"/> class="d-block" style="width:15%;">
                    <img src=<c:url value="/resources/images/${teacher.licenseImageFileName3}"/> class="d-block" style="width:15%;">
                    <img src=<c:url value="/resources/images/${teacher.licenseImageFileName4}"/> class="d-block" style="width:15%;">
                    <img src=<c:url value="/resources/images/${teacher.licenseImageFileName5}"/> class="d-block" style="width:15%;">
                    <img src=<c:url value="/resources/images/${teacher.teacherimageFileName}"/> class="d-block" style="width:15%;">
                    
</body>

</html>