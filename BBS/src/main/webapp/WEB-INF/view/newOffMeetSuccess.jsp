<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
	게시글을 등록했습니다.
	<br>
	${ctxPath = pageContext.request.contextPath }
	<a href="list.do">[게시글목록보기]</a>
	<a href="read.do?no=${newOffMeetNo }">[게시글내용보기]</a>
</body>
</html>