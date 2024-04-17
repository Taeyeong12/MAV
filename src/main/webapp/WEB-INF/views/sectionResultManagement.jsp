<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
<title></title>
</head>
<body>
              <!-- 점수부여관리 -->
      <div class="room-title">결과관리</div>
      <c:forEach items="${myRooms}" var="room">
          <c:choose>
              <c:when test="${room.matched == 2}">
                  <c:forEach items="${matchView}" var="MatchRoom">
                      <c:if test="${room.roomNum == MatchRoom.roomNum}">
                          <div class="card-1 mb-4">
                              <div class="room-info">
                                  <div class="room-date">
                                      <span>${room.roomDate}<br>${room.roomTime}</span>
                                  </div>
                                  <div class="room-title room-dt">
                                      <span class="romm-ddt">no.${room.roomNum} &nbsp${room.roomName} </span><br>
                                      <span class="romm-ddt">${MatchRoom.matchTitle}</span>
                                  </div>
                                  <span class="room-application ">                                           
                                      <a href="<c:url value='/match/matchingDetail'/>?roomNum=${MatchRoom.roomNum}"
                                          class="room-application-link room-application-btn4">조회</a>                                                                                 										
                                  </span>
                              </div>
                          </div>
                      </c:if>
                  </c:forEach>
              </c:when>
              	<c:otherwise>
       <!-- 비워두기 -->					      
   </c:otherwise>                         
          </c:choose>                
      </c:forEach>
</body>
</html>