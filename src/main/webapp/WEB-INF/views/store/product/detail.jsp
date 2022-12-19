<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../../layout/header.jsp" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function(){
	
	// 상품등록 버튼 클릭 처리
	$("#add-store-btn").click(function(){
		
		var productNo = $("#productNo").val();
		
		$.ajax({
			type : "GET",
			url : "/store/write",
			data : {productNo},
			success : function() {
				console.log("ajax 성공");
				location.href = "/store/write?productNo=" + productNo;
			},
			error : function() {
				console.log("ajax 실패");
			}
		});
	});
	
	// 수정버튼 클릭 처리
	$("#update-btn").click(function(){
		location.href = "/store/product/update?productNo=${viewProduct.productNo }"
	})
	
	// 삭제버튼 클릭 처리
	$("#delete-btn").click(function(){
		if(confirm("삭제 하시겠습니까?") == true) {
			alert("삭제 되었습니다.");
			location.href = "/store/product/delete?productNo=${viewProduct.productNo }"
		} else {
			return false;
		}
	})
	
	// 목록버튼 클릭 처리
	$("#list-btn").click(function(){
		location.href = "/store/product";
	})
	
})

</script>

<style type="text/css">
div {
	font-family: 'Dongle', sans-serif;
}

#wrap-detail {
	width: 1900px;
	height: 750px;
	
	display: flex;
	justify-content: center;
	align-items: center;
}

#wrap-info {
	width: 1024px;
	
	display : flex;
	justify-content: center;
}

#product-info-img {
	width: 50%;

	display: flex;
	justify-content: center;
}

#product-info {
	width: 50%;
}

#info {
	display: flex;
	justify-content: center;
}

#product-price {
	font-size: 40px;
	font-weight: bold;
	color: #701667;
}

#product-quantity {
	font-size: 25px;
}

#product-quantity > input {
	width: 50px;
	height: 30px;
	text-align: center;
	margin: 0 5px 0 -5px;
}

#product-quantity-stock {
	display: flex;
	align-items: flex-end;
	margin: 5px;
}

#product-stock {
	font-size: 25px;
}

.product-btn {
	font-size: 25px;

	width: 60px;
	height: 40px;
	
	margin: 20px 5px 0 0;
}

#list-btn {
	float: right;
	margin-bottom: 30px;
}

</style>

<div id="wrap-detail">


<input type="hidden" id="productNo" name="productNo" value="${viewProduct.productNo }">

<section id="wrap-info">
	<div id="product-info-img">
		<div>
			<div><img src="<%=request.getContextPath() %>/upload/${viewProduct.productImg.storedName }" width="340px" height="405px"></div>
		</div>
	</div>
	<div id="product-info">
		<button type="button" id="list-btn" class="product-btn btn">목록</button>
		<div style="margin-top: 80px;">
			<div style="font-size: 50px; font-weight: bold;">${viewProduct.productName }</div>
			<div id="product-price"><fmt:formatNumber type="currency" value="${viewProduct.price }"/></div>
			<div id="product-quantity-stock">
				<div id="product-stock">재고 ${viewProduct.stock }개</div>
			</div>
			<div>
				<button id="add-store-btn" class="product-btn btn" style="width: 80px; background-color: #EBB99D">상품판매</button>
				<button id="update-btn" class="product-btn btn">수정</button>
				<button id="delete-btn" class="product-btn btn">삭제</button>
			</div>
		</div>
	</div>
</section>

</div>

<%@	include file="../../layout/footer.jsp" %>