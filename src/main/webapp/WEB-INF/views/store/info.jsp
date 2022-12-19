<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#product-info-img {
	margin-top: 15px;
	text-align: center;
}
</style>

<div id="product-info-img">
	<img src="<%=request.getContextPath() %>/upload/${productImg.storedName }">
</div>

	