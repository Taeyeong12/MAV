<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
<h1>글쓰기 폼</h1>
    <form action="./write" method="post">
    이름 : 세션에서 읽어들인 이름<br>
    제목 : <input type="text" name="boardTitle" placeholder="제목"/><br>
    내용 : <textarea name="boardContents" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea><br>
    <input type="submit" value="등록하기"/>
    </form>
</body>
</html>