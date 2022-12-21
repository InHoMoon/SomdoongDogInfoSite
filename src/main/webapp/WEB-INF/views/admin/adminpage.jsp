<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

.box1 {
	display: flex;
	justify-content: center;
}

.imgbox {
	margin: 2%;
}

.imgs {
	width: 120px;
	height: 100px;
	margin: auto;
	display: block;
}

h1 {
	display: flex;
	justify-content: center;
}

</style>
<c:import url="../layout/header.jsp" />



<h1>ADMIN_PAGE</h1>
<hr>

<div class="box1">
   <div class="imgbox">
      <a href="/admin/doginfo/list"><img class="imgs" src="/resources/img/강아지연구소.png"/></a>
      <h3>강아지연구소</h3>
   </div>

   <div class="imgbox">
      <a href="#"><img class="imgs" src="/resources/img/공지사항.png"/></a>
      <h3>공지사항</h3>
   </div>
</div>


<div class="box1">
   <div class="imgbox">
      <a href="/mypage/list"><img class="imgs" src="/resources/img/1대1문의.png"/></a>
      <h3>1:1 문의</h3>
   </div>

   <div class="imgbox">
      <a href="#"><img class="imgs" src="/resources/img/상품.png"/></a>
      <h3>상품관리</h3>
   </div>
</div>

<c:import url="../layout/footer.jsp" />