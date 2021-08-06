<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 읽기</title>
<link href="../css/main.css" rel="stylesheet">
<style type="text/css">
</style>
</head>
<body>
	<div id="menu">
		<c:import url="/WEB-INF/view/component/menu.jsp" />
	</div>
	<div id="main">
		<table border="1" width="100%">
			<tr>
				<td>번호</td>
				<td>${noticeData.notice.number }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${noticeData.notice.writer.name }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><c:out value="${noticeData.notice.title }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><c:out value="${noticeData.content}" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:set var="pageNo"
						value="${empty param.pageNo ? '1' : param.pageNo }" /> <a
					href="list.do?pageNo=${pageNo}">[목록]</a> <c:if
						test="${authUser.id == noticeData.notice.writer.id }">
						<a href="modify.do?no=${noticeData.notice.number }">[게시글수정]</a>
						<a href="delete.do?no=${noticeData.notice.number }">[게시글삭제]</a>
					</c:if></td>
			</tr>
		</table>
	</div>
</body>
</html>