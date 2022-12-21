<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

.ib1 {
 display: flex;
  justify-content: center;

}
.imgbox{
 margin: 2%;

}
.imgs {
  width: 120px;
  height: 100px;
   margin: auto;
   display: block;
}
h1{
 display: flex;
  justify-content: center;
}
</style>
<c:import url="../layout/header.jsp" />



<h1>MYPAGE</h1>
<hr>

<div class="ib1">

	<div class="imgbox">
		<a href="/mypage/update/memberUpdateView?userid=${userid }"><img class="imgs" src="/resources/img/사람.png"/></a>
		<h3>정보수정</h3>
	</div>

	<div class="imgbox">
		<a href="/mypage/myboard/list?userid=${userid }"><img class="imgs" src="/resources/img/글.png"/></a>
		<h3>내가 쓴 글</h3>
	</div>
</div>


<div class="ib1">
	<div class="imgbox">
		<a href="/mypage/wishlist/list"><img class="imgs" src="/resources/img/장바구니.png"/></a>
		<h3>위시리스트</h3>
	</div>

	<div class="imgbox">
		<a href="/mypage/purchase/list"><img class="imgs" src="/resources/img/구매내역.png"/></a>
		<h3>구매내역</h3>
	</div>
	
	<div class="imgbox">
		<a href="/mypage/inquire/list"><img class="imgs" src="/resources/img/물음표.png"/></a>
		<h3>1대1문의</h3>
	</div>
</div>

<c:import url="../layout/footer.jsp" />
