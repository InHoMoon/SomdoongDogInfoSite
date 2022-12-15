<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	$(document).ready(function() {
		
		$(".menu").click(function() {
			
			var id_check = $(this).attr("id");
			
			console.log(id_check);

			var url = "/store/product/" + id_check

			$.ajax({
				type : "POST",
				url : url,
				async : true,
				cache : "false",
 				data : {id_check},
				dataType : "html",
				success : function(data) {
					console.log("ajax 성공")

					$("#product-content").children().remove();

					$("#product-content").html(data);
				},
				error : function() {
					console.log("ajax 실패")
				}
			})
		});
		
		$(".heart").click(function() {
			$(this).toggleClass('change');
		})
	})
</script>

<style type="text/css">
#wrap-detail {
	width: 1900px;
	height: 100%;
	min-height: 100%;
}

#wrap-info {
	margin-bottom: 40px; display : flex;
	justify-content: center;
	display: flex;
}

#store-info {
	width: 1024px;
	display: flex;
	justify-content: center;
}

#store-info>div>div {
	margin-bottom: 10px;
}

#product-info {
	word-break: break-all;
	font-size: 15px;
}

#product-price {
	font-size: 20px;
	font-weight: bold;
	color: #701667;
}

#product-quantity>input {
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

#store-btn>input {
	width: 100px;
	height: 30px;
}

.delivery {
	font-size: 15px;
	
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
	width: 1024px;
}

#store-content-menu > li {
	font-family: 'Dongle';
	font-size: 25px;

	float: left;
	
	margin-right: 10px;
	
	cursor: pointer;
}

#info-menu {
	border-bottom: 1px solid #d3d3d3;
	height: 40px;
}

.menu:hover {
	box-shadow: 2px 2px 10px #d3d3d3;
}
</style>

<div id="wrap-detail">

<section id="store-title">
	<h2 style="text-align: center; font-weight: bold;">${viewStore.title }</h2>
	<hr>
</section>
<section id="wrap-info">
	<div id="store-info">
		<div style="width: 34%;"><img src="/resources/store_monster08.gif" width="340px" height="405px"></div>
		<div style="width: 66%; padding-left: 30px;">
			<div style="font-size: 25px; font-weight: bold; margin-bottom: 10px;">상품 설명</div>
			<div id="product-info">${viewStore.info }</div>
			<div id="product-price"><fmt:formatNumber type="currency" value="${viewStore.price }"/></div>
			<div id="product-quantity-stock">
				<div id="product-quantity"><input type="number" value="1" min=""></div>
				<div id="product-stock">재고 ${viewStore.stock }개</div>
			</div>
			<div id="store-btn"><input type="button" value="구매하기"></div>
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
		<ul id="store-content-menu">
			<li class="menu" id="info" style="margin-left: 10px;">상세정보</li>
			<li class="menu" id="review">상품후기</li>
		</ul>
	</div>
	<div id="product-content" style="text-align: center;">
		<%@	include file="./product_info.jsp" %>
	</div>
</div>
</section>
<section></section>

</div>

<%@	include file="../layout/footer.jsp" %>