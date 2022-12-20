<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(document).ready(function() {
		
	$(".heart").click(function() {
		$(this).toggleClass('change');
		
		var storeNo = $("#storeNo").val();
			
		console.log(storeNo);

		var url = "/store/detail";

		$.ajax({
			type : "POST",
			url : url,
			data : {storeNo},
			dataType : "json",
			success : function(result) {
				
				if(result == 1) {
					alert("관심상품 등록 완료")
				} else {
					alert("로그인 후 이용해 주세요")
					console.log("콘솔 테스트");
					console.log("result : " + result)
				}
			},
			error : function() {
				alert("관심상품 등록 실패")
			}
		})
	});
	
	// 구매버튼 클릭 처리
	$("#buy-btn").click(function(){
		$("form").submit();
	})
	
	// 수정버튼 클릭 처리
	$("#update-btn").click(function(){
		location.href = "/store/update?storeNo=${viewStore.storeNo }"
	})
	
	// 삭제버튼 클릭 처리
	$("#delete-btn").click(function(){
		if(confirm("게시글을 삭제 하시겠습니까?") == true) {
			alert("삭제 되었습니다.");
			location.href = "/store/delete?storeNo=${viewStore.storeNo }"
		} else {
			return false;
		}
	})
	
	// 목록버튼 클릭 처리
	$("#list-btn").click(function(){
		location.href = "/store/main";
	})
})
</script>

<style type="text/css">
div {
	font-family: 'Dongle', sans-serif;
}

#wrap-detail {
	width: 1900px;
	height: auto;
}

#wrap-title {
	width: 1024px;
	text-align: center;
	
	border-bottom: 1px soild #d3d3d3;
}

#store-title {
 	width: 1900px;
    display: flex;
    justify-content: center;
 	
	font-family: 'Dongle';
	font-weight: bold;
 	font-size: 70px;
}

#wrap-info {
	display : flex;
	justify-content: center;
	
	margin-bottom: 40px;
}

#store-info {
	width: 1024px;
	display: flex;
	justify-content: center;
}

#product-info {
	width: 640px;
	height: 110px;
	word-break: break-all;
	font-size: 25px;
}

#product-price {
	font-size: 35px;
	font-weight: bold;
	color: #701667;
}

#product-quantity {
	font-size: 20px;
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
	font-size: 20px;
}

#store-btn > input {
	font-size: 25px;
	width: 100px;
	height: 35px;
	
	background-color: #EBB99D;
}

.delivery {
	font-size: 25px;
	
	margin-right: 5px;
}

.heart {
	width: 15px;
	height: 15px;
	background: #d3d3d3;
	position: relative;
	transform: rotate(45deg);
	
	cursor: pointer;
}

.heart:hover {
	background: #ea2027; 
}

.heart:hover:before, .heart:hover:after {
	background: #ea2027; 
}

.heart::before, .heart::after {
	content: "";
	width: 15px;
	height: 15px;
	position: absolute;
	border-radius: 50%;
	background: #d3d3d3;
}

.heart::before {
	left: -50%;
}

.heart.change , .heart.change:after, .heart.change:before {
	background: #ea2027;
}

.heart::after {
	top: -50%;
}

#wrap-content {
	display: flex;
	justify-content: center;
}

#store-content {
	margin-top: -20px;
	width: 1024px;
}

#store-content-menu > div {
	font-family: 'Dongle';
	font-size: 25px;
	float: left;
	
	margin-right: 10px;
}

#info-menu {
	border-bottom: 1px solid #d3d3d3;
	height: 40px;
}

#wrap-btn {
	width: 200px;

    float: right;
	display: flex;
	justify-content: flex-end;
	
}

#wrap-btn > button {
	width: 60px;
	height: 40px;
	
    margin: -10px 1px;
	
	font-size: 25px;
	font-family: 'Dongle', sans-serif;
	
	display: flex;
}

</style>
<form action="/store/order/item" method="get">

<div id="wrap-detail">

<section id="store-title">
<div id="wrap-title">
	<div>${viewStore.title }</div>
</div>
	<input type="hidden" id="storeNo" name="storeNo" value="${viewStore.storeNo }" />
	<input type="hidden" id="productNo" name="productNo" value="${viewStore.product.productNo }" />
	<input type="hidden" id="userid" name="userid" value="${sessionScope.userid }" />
</section>
<section id="wrap-info">
	<div id="store-info">
		<div style="width: 34%;"><img src="<%=request.getContextPath() %>/upload/${profileImg.storedName }" class="img-rounded" width="340px" height="405px"></div>
		<div style="width: 66%; padding-left: 30px;">
			<div style="font-size: 40px; font-weight: bold;">${viewStore.product.productName }</div>
			<div style="font-size: 30px; font-weight: bold; margin-bottom: 10px;">상품 설명</div>
			<div id="product-info">${viewStore.info }</div>
			<div id="product-price"><fmt:formatNumber type="currency" value="${viewStore.product.price }"/></div>
			<div id="product-quantity-stock">
				<div id="product-quantity">
					<input type="number" id="orderQuantity" name="orderQuantity" value="1" min="1" max="${viewStore.product.stock }">
				</div>
				<div id="product-stock">재고 ${viewStore.product.stock }개</div>
			</div>
			<div id="store-btn"><input type="button" id="buy-btn" class="btn" value="구매하기"></div>
			<div>
				<div class="delivery">배송비: 3,000원</div>
				<div class="delivery">
					30,000원 이상 구매 시 무료배송
					<div class="heart" style="float: right;"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<section id="wrap-content">
<div id="store-content">
	<div id="info-menu">
		<div id="wrap-btn">
			<button type="button" id="list-btn" class="btn">목록</button>
			<button type="button" id="update-btn" class="btn">수정</button>
			<button type="button" id="delete-btn" class="btn">삭제</button>
		</div>
		<div id="store-content-menu">
			<div id="info" style="margin-left: 10px;">상세정보</div>
		</div>
	</div>
	<div id="product-content" style="text-align: center;">
		<%@	include file="./info.jsp" %>
	</div>
</div>
</section>

</div>

</form>
<%@	include file="../layout/footer.jsp" %>