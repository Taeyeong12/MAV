<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <script src="https://kit.fontawesome.com/1a6288a620.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
        crossorigin="anonymous">
    <title>게시판 목록보기</title>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
        rel='stylesheet' type='text/css'>
    <style>
        * {
            font-family: 'Spoqa Han Sans Neo', 'sans-serif';
        }

        .notice {
            padding-top: 3rem;
            margin: 0 auto;
            text-align: center;
            font-size: 3rem;
            font-weight: bold;
        }

        .noticemom {
            width: 80vw;
            height: 10rem;
            margin: 0 auto;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 50%;
            color: white;
        }

        .pagination .page-link {
            color: #007bff;
            background-color: transparent;
            border: none;
            width: 2.5rem;
            height: 2.5rem;
            line-height: 2.5rem;
            text-align: center;
            padding: 0;
        }

        .pagination .page-link span {
            display: inline-block;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            line-height: 2.5rem;
        }

        .pagination .page-item:first-child .page-link,
        .pagination .page-item:last-child .page-link {
            border-radius: 0;
        }

        .pagination .page-item.disabled .page-link {
            color: #6c757d;
            background-color: transparent;
            border: none;
        }

        .pagination .page-item.disabled .page-link:hover {
            background-color: transparent;
            border: none;
        }

        .pagination .page-link:hover {
            background-color: #e9ecef;
        }

        .table th, .table td {
            text-align: center;
        }

        .table .actions {
            text-align: right;
        }

        .table th:nth-child(2),
        .table td:nth-child(2) {
            width: 40%;
        }

        .table th:nth-child(4),
        .table td:nth-child(4),
        .table th:nth-child(5),
        .table td:nth-child(5) {
            width: 10%;
        }
	    .table th:nth-child(3),
	    .table td:nth-child(3) {
	        width: 40%;
	    }
    </style>
</head>

<body>
    <jsp:include page="./section/nav.jsp" />

    <div class="noticemom">
        <h1 class="notice mt-5">공지사항</h1>
    </div>
    <section class="board">

        <!-- board list area -->
        <div id="board-list" class="container mt-3">
            <table class="table ">
                <thead style="background: linear-gradient(to right, #ff6b6b, #434343);">
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">등록일</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="notices" items="${notices}">
                        <tr>
                            <td style="color:#C1C1C1;">${notices.noticeNum}</td>
							<td style="text-align: left;"><a
							    href="<c:url value='/notice/noticeDetail'/>?noticeNum=${notices.noticeNum}"
							    class="text-dark"><i class="fa-solid fa-square"></i>&nbsp ${notices.noticeTitle}</a></td>
                            <td>${notices.noticeWriter}</td>
                            <td>${notices.noticeDate}</td>
                            <td>${notices.noticeHits}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <div class="text-center">
            	<c:choose>
	            	<c:when test = "${member.adminApprove eq true}">
	                	<a href="./writeForm" class="btn btn-primary">글쓰기</a>
	                </c:when>
                </c:choose>
            </div>
            <br>

            <nav aria-label="Page navigation" class="mt-3">
                <ul class="pagination justify-content-center">
                    <c:set var="startPage"
                        value="${currentPage - 2 > 0 ? currentPage - 2 : 1}" />
                    <c:set var="endPage"
                        value="${startPage + 4 > pageCount ? pageCount : startPage + 4}" />

                    <c:if test="${currentPage > 1}">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link"
                                href="<c:url value='/notice/list'/>?page=${currentPage - 1}"
                                aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="page" begin="${startPage}" end="${endPage}">
                        <li class="page-item ${page == currentPage ? 'active' : ''}">
                            <a class="page-link"
                                href="<c:url value='/notice/list'/>?page=${page}"><span>${page}</span></a>
                        </li>
                    </c:forEach>

                    <li class="page-item ${currentPage == pageCount ? 'disabled' : ''}">
                        <a class="page-link" href="<c:url value='/notice/list'/>?page=${currentPage + 1}"
                            aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </section>
</body>

</html>