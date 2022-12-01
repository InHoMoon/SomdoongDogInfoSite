<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#wrap-detail {
	width: 1900px;
	height: 100%;
	min-height: 100%;
}

#wrap-info {
	width: 1900px;
	
	display: flex;
	justify-content: center;
	
}

#store-info {
	width: 1024px;

	display: flex;
	justify-content: center;
}

</style>

<div id="wrap-detail">

<section id="store-title">
	<h2 style="text-align: center;">${viewStore.title }</h2>
	<hr>
</section>
<section id="wrap-info">
	<div id="store-info">
		<div style="width: 34%;"><img src="/resources/monster08.gif" width="340px" height="405px"></div>
		<div style="width: 66%; padding-left: 30px;">
			<div style="font-size: 30px;">상품 설명</div>
			<div style="word-break:break-all;">${viewStore.info }</div>
			<div><fmt:formatNumber type="currency" value="${viewStore.product.price }"/></div>
		</div>
	</div>
</section>
<section id="store-content">

</section>
<section></section>

</div>

<%@	include file="../layout/footer.jsp" %>