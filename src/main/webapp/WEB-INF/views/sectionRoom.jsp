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
	   <!-- 경기장 관리 부분 -->
	   <div>
	 <div class="room-title">경기장관리</div>
	  <c:forEach items="${myRooms}" var="room">
	      <c:choose>
	          <c:when test="${room.matched == 0}">
	              <div class="card-1 mb-3">
	                  <div class="room-info">
	                      <div class="room-date">
	                          <span>${room.roomDate}<br>${room.roomTime}</span>
	                      </div>
	                      <div class="room-title room-dt">
	                          <span class="romm-ddt">no.${room.roomNum} &nbsp${room.roomName}</span>
	                      </div>
	                      <span class="room-application .ehgus">
	                          <a href="<c:url value='/match/roomsDetail'/>?roomNum=${room.roomNum}"
	                              class="room-application-link room-application-btn5">조회</a>
	                          <a href="<c:url value='/room/roomsUpdate'/>?roomNum=${room.roomNum}"
	                              class="room-application-link room-application-btn5">수정</a>
	                          <a href="<c:url value='/room/deleteMyRoom'/>?roomNum=${room.roomNum}"
	                               class="room-application-link room-application-btn5">삭제</a>
	                       </span>
	                   </div>
	               </div>
	           </c:when>
				<c:otherwise>
				    <!-- 비워두기 -->				      
				</c:otherwise>                    
	       </c:choose>               
	   </c:forEach>
      </div>     
</body>
</html>