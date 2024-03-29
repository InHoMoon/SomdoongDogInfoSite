<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>솜이네둥이네 - 반려동물의 모든 것!</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle:wght@300;400&display=swap" rel="stylesheet">

<style type="text/css">

* {
	margin: 0;
	padding: 0; /* 모든 마진과 패딩 값 초기화*/
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none; 
}

#header_wrap {
	height: 100vh
}

header {
	box-shadow: 0 1px 6px 0 #d3d3d3;
	background: white;
 	position: sticky;
  	top: 0;
  	font-family: 'Dongle', sans-serif;
}

header > div {
	width: 90%;
 	min-width: 1010px;
	max-width: 1200px;
 	height: 100px;
	margin: 0 auto;
}

header .logo {
	float: left;
	margin-left: 90px;
}

header .logo img {
	width: 130px;
}

header .menu_wrap {
	float: right;
 	margin-right: 80px;
}

.dept1 {
	font-size: 0;
	position: relative;
}

.dept2 {
 	display: none; 
/* 	background: yellow; */
 	position: absolute;
	width: 100px;
}

.dept1>li {
	display: inline-block;
	width: 100px;
	text-align: center;
	font-size: 35px;
	font-weight: 100;
	vertical-align: top;
	margin-left: 20px; 
  	margin-top: 32px; 
  	margin-bottom: 10px;
  /*	border-radius: 20px;
  	border: 2px solid #ddd;*/
  	
}

.dept1>li>a {
	display: block; 
	text-decoration: none;
	padding: 2px 0;
	font-size: 35px;
	color: #000;
}

.dept1>li:hover>.dept2 {
	display: block;
/* 	border-left: 2px solid #ccc; */
	box-shadow:  1px 3px 3px #d3d3d3;
}

.dept1>li:hover>a {
	font-weight: 400;
	color: #000;
	text-shadow: 5px 5px 5px yellow;
}

.dept2 a {
	text-decoration: none;
	display: block;
	padding: 7px 0;
	background: white;
	transition-duration: 0.5s; /* 트랜지션에 일어나는 지속시간 */
}

.dept2 li:first-child a {
	margin-top: 0px;
}

.dept2 a:hover {
 	background: #FFF8DC;
}

.dept2 li {
	font-size: 25px;
	font-weight: 100;
}

footer {
	border-top: 1px solid #d3d3d3;
	height: 60px;
	font-family: 'Dongle', sans-serif;
}

footer #footer_wrap {
	width: 90%;
	min-width: 1000px;
	max-width: 1200px;
	height: 50px;
	margin: 0 auto;
	text-align: center;
}

#footer_wrap .span {
	margin-top: 18px;
	color:#d3d3d3;
	font-weight: 100;
	font-size: 20px;
}

</style>

</head>
<body>

<div id="header_wrap">
<header>
<div>
	<h1 class="logo">
	<a href="/main/main"><img src="/resources/img/logo.PNG"></a>
	</h1>
	<div class="menu_wrap">
	<nav>
	<ul class="dept1">
		<li><a href="/main/main">HOME</a></li>
		<li><a href="#">COMMUNITY</a>
			<ul class="dept2">
				<li><a href="/community/showlist">강아지 자랑</a></li>
				<li><a href="/community/recommend/list">맛집 추천</a></li>
				<li><a href="/community/free/list">강아지 Q&A</a></li>
				<li><a href="/admin/doginfo/list">강아지 연구소</a></li>
			</ul>
		</li>
		<li><a href="/store/main" style="margin-left: 16px;">STORE</a></li>
		<li><a href="#">CUSTOMER</a>
			<ul class="dept2">
				<li><a href="/notice/list">공지사항</a></li>
				<li><a href="/mypage/list">1:1 문의</a></li>
			</ul>
		</li>
		<c:if test="${empty login }">
		<li><a href="/member/login">LOGIN</a></li>
		</c:if>
		<c:choose>
      	<c:when test="${not empty login }">
		<li><a href="/mypage/mypage">MYPAGE</a>
		<ul class="dept2">
			<li><a href="/mypage/update/memberUpdateView?userid=${userid }">정보 수정</a></li>
			<li><a href="/mypage/wishlist/list">관심상품</a></li>
			<li><a href="/mypage/purchase/list">구매내역</a></li>
			<li><a href="/mypage/myboard/list?userid=${userid }">게시글 수정</a></li>
			<li><a href="/mypage/inquire/list">1:1 문의 내역</a></li>
		</ul>
		</li>
		<li><a href="/member/logout">LOGOUT</a></li>
		</c:when>
		<c:when test="${not empty adminlogin }">
	      <li><a href="/admin/adminpage">ADMIN</a>
	      <ul class="dept2">
	         <li><a href="/admin/doginfo/list">강아지연구소</a></li>
	         <li><a href="/notice/list">공지사항</a></li>
	         <li><a href="/mypage/list">1대1문의</a></li>
	         <li><a href="/store/product">상품관리</a></li>
	      </ul>
	      </li>
	      <li><a href="/admin/logout">LOGOUT</a></li>
	      </c:when>
	      </c:choose>
	</ul>
	</nav>
	</div>
</div>
</header>