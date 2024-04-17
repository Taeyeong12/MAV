<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Rooms</title>
</head>
<body>

<h2>My Rooms</h2>

test 페이지 입니다 :)
<c:forEach var="room" items="${allrooms}">
    <div>
        <p>Room ID: ${room.roomId}</p>
        <p>Room Name: ${room.roomName}</p>
        <p>Capacity: ${room.roomCapacity}</p>
        <p>Count: ${room.roomCount}</p>
        <p>Category: ${room.roomCategory}</p>
        <p>Date: ${room.roomDate}</p>
        <p>Time: ${room.roomTime}</p>
        <a href="<c:url value='/store/deleteRoom'/>?roomNum=${room.roomNum}">삭제</a>   
    </div>
</c:forEach>

</body>
</html>


