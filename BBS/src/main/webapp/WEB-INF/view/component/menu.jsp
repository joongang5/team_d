<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div id="menuItem" onclick="menuClick('boxoffice/list')">영화 홈</div>
<div id="menuItem" onclick="menuClick('movie/list')">최신 영화 100</div>
<div id="menuItem" onclick="menuClick('login')">로그인 페이지</div>
<div id="menuItem" onclick="menuClick('myPage')">마이 페이지</div>
<div id="menuItem" onclick="menuClick('notice/list')">공지사항</div>
<div id="menuItem" onclick="menuClick('offmeet/list')">영화팟 찾기</div>
<div id="menuItem" onclick="menuClick('review/list')">영화 토론/리뷰</div>
<div id="menuItem" onclick="menuClick('admin')">관리자</div>

<div id="menuLoginBox">
<br>
<c:if test="${! empty authUser}">
			
			${authUser.name}님<br>
			<a href="logout.do"><button>로그아웃</button></a>
			<a href="myPage.do"><button>마이페이지</button></a>
			
		</c:if>
</div>

<script type="text/javascript" src="/BBS/js/menu.js"></script>