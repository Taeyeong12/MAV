<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
            <!-- 토너먼트 관리 -->
            <div class="room-title">토너먼트관리</div>
            	<c:forEach items="${newtournament}" var="tournament">
	                <div class="card-1 mb-4">
	                    <div class="room-info">
	                        <div class="room-date">
	                            <span>${tournament.tournamentDate}<br>${tournament.tournamentTime}</span>
	                        </div>
	                        <div class="room-title room-dt">
	                            <span class="romm-ddt">no.${tournament.tournamentNum} </span><br>
	                        </div>
	                        <span class="room-application ">
	                            <a href="<c:url value='/tournament/updateTournament'/>?tournamentNum=${tournament.tournamentNum}"
	                                class="room-application-link room-application-btn3">수정</a>
	                            <!-- 수정코드 필요여부에 따라 -->
	                            <a href="<c:url value='/tournament/deleteTournament'/>?tournamentNum=${tournament.tournamentNum}"
	                                class="room-application-link room-application-btn3">삭제</a>							
	                        </span>
	                    </div>
	                </div>
            </c:forEach>
</body>
</html>