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
회원가입이 완료되었습니다
	<h3>회원 아이디 : <c:out value="${member.memberId}"/></h3>
	<h3>회원 이름 : <c:out value="${member.memberName}"/></h3>
	<h3>회원 생년월일 : <c:out value="${member.memberBirth}"/></h3>
	<h3>회원 이메일 : <c:out value="${member.memberEmail}"/></h3>
</body>
</html>