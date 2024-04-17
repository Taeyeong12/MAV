<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>게시판 목록보기</title>
</head>
    <style>
        body {
            width: 80vw;
            margin: 0 auto;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        section.board {
            padding: 80px 0;
        }

        .page-title {
            margin-bottom: 40px;
        }

        .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }

        .login-info {
            margin-bottom: 10px;
            text-align: right;
        }

        .board-table {
            font-size: 13px;
            width: 100%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .board-table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .board-table th {
            text-align: center;
        }

        .board-table .th-num {
            width: 100px;
            text-align: center;
        }

        .board-table .th-viewcnt {
            width: 100px;
            text-align: center;
        }

        .board-table .th-date {
            width: 200px;
        }

        .board-table th,
        .board-table td {
            padding: 14px 0;
        }

        .board-table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
        }

        .board-table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
        }

        .board-table tbody th p {
            display: none;
        }

        .btn {
            display: inline-block;
            padding: 0 30px;
            font-size: 15px;
            font-weight: 400;
            background: transparent;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            text-transform: uppercase;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            -ms-transition: all 0.3s;
            -o-transition: all 0.3s;
            transition: all 0.3s;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover,
        .btn-primary:focus {
            background: #0056b3;
            border-color: #0056b3;
            color: #fff;
        }
    </style>

<body>
<jsp:include page="./section/nav.jsp" />
<section class="board">
    <div class="page-title bg-dark text-light">
        <div class="container">
            <h3>게시판 글 목록보기</h3>
        </div>
    </div>

    <div class="login-info bg-light">
        <div class="container">
            <span class="login-info_user">
                <span></span>
            </span>
            <span class="login-info_logout">
                <a href="/logout">로그아웃</a>
            </span>
            <span class="login-info_login">
                <a href="/loginform">로그인</a>
            </span>
            <span class="login-info_join">
                <a href="/userRegForm">회원가입</a>
            </span>
        </div>
    </div>

    <!-- board list area -->
    <div id="board-list" class="container mt-3">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col" class="th-num">번호</th>
                <th scope="col" class="th-title">제목</th>
                <th scope="col" class="th-viewcnt">조회수</th>
                <th scope="col" class="th-name">작성자</th>
                <th scope="col" class="th-date">등록일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${list}">
                <tr>
                    <td>${board.boardId}</td>
                    <td>
                        <a href="<c:url value='/board'/>?boardId=${board.boardId}" class="text-dark">${board.title}</a>
                    </td>
                    <td>${board.viewCnt}</td>
                    <td>${board.name}</td>
                    <td>${board.regdate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="text-center">
            <a href="./writeForm" class="btn btn-primary">글쓰기</a>           
        </div>

        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <c:forEach var="n" begin="1" end="${pageCount}">
                    <li class="page-item">
                        <a class="page-link" href="<c:url value='/board'/>?page=${n}">${n}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</section>
</body>
</html>
