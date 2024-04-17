<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${member}" var="members">
		회원 아이디 = ${members.memberId} <br>
		회원 이름 = ${members.memberName} <br>
		회원 주소 = ${members.memberAddr} <br>
		회원 이메일 = ${members.memberEmail} <br>
	</c:forEach>
</body>
</html>