<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@	include file="../layout/header.jsp" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 상품추가 버튼 클릭 처리
	$("#add-btn").click(function() {
		location.href = "/store/product/insert";
	})
})
</script>


<style type="text/css">
a {
	text-decoration: none !important;
	color: inherit;
}

#wrap-content {
	width: 1900px;
	height: auto;

	display: flex;
	justify-content: center;
}

#wrap-list {
	width: 1500px;
	height: 750px;
}
#wrap-list > div {
	width: 1455px;
	margin-top: 30px;
}

#list-case {
	width: 320px;
	font-family: 'Dongle', sans-serif;

 	margin: 25px;
	float: left;
}

#list-case {
	word-break:break-all;
}

li > img:hover {
	box-shadow: 2px 2px 10px #d3d3d3;
}

ul > li > img:hover {
	cursor: pointer;
}

#product-title {
	font-size: 40px;
	
	margin-bottom: 5px;
}

#product-price {
	font-size: 40px;
	font-weight: bold;
}

#add-btn {
	width: 80px;
	height: 40px;
	
	font-size: 25px;
	float: right;	
	
	font-family: 'Dongle', sans-serif;
}

</style>

<div id="wrap-content">

<div id="wrap-list">
<div><button type="button" id="add-btn" class="btn">상품 추가</button></div>
	<c:forEach items="${productList }" var="list">
		<ul id="list-case">
			<li><img src="<%=request.getContextPath() %>/upload/${list.productImg.storedName }"
				onclick="location.href='/store/product/detail?productNo=${list.productNo }'" width="320px" height="320px"></li>
			<li id="product-title"><a href="/store/list/product/detail?productNo=${list.productNo }">${list.productName }</a></li>
			<li id="product-price"><fmt:formatNumber value="${list.price }"/>원</li>
		</ul>
	</c:forEach>
</div>

</div>

<%@	include file="../layout/footer.jsp" %>