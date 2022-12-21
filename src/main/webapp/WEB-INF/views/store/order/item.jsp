<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../../layout/header.jsp" %>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#payment-btn").click(function(){
		
		if(confirm("주문 하시겠습니까?") == true) {
			$("form").submit();
			
			alert("주문이 완료되었습니다!");
			
		} else {
			return false;
		}
	});
});


</script>

<style type="text/css">
#wrap {
	width: 1900px;
	height: auto;
	
	margin-top: 20px;
	
	font-family: 'Dongle', sans-serif;
	font-size: 25px;
}

#buy-head {
	font-size: 40px;
	text-align: center;
}

#shipping-info {
	display: flex;
	justify-content: center;
}

#wrap-Purchase-info  {
	width: 1900px;
	height: auto;
	
	display: flex;
	justify-content: center;
}

#wrap-buy {
	width: 1024px;
	
}

#wrap-price {
	width: 20%;
    height: 100%;
    
    margin-right: 15px;
    
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: flex-end;
}

#buy-title {
	width: 1024px;
	padding-left: 10px;
	background-color: #EDD99F;
	
	border-radius: 5px 5px 0 0;
}

#buy-info {
	height: 220px;
	border-radius: 0 0 5px 5px;
	padding-left: 10px;

	display: flex;
	align-items: center;
	background-color: #EDE7E0;
}

.user-input {
	width: 1024px;
	margin-bottom: 10px;
	
	font-size: 25px;
}

#payment-info {
	display: flex;
	justify-content: center;
}

#wrap-payment {
	width: 1024px;
}

#total-order-sum {
	width: 1024px;

	font-size: 40px;

	display: flex;
    justify-content: flex-end;
}

#payment-tab {
	height: 195px;

    background: #EDD99F;
	padding: 20px 20px 0 20px;
	
    border-radius: 5px;
}

#payment-tab > div {
	margin-bottom: 20px;
}

#wrap-payment-btn {
	display: flex;
	justify-content: center;
	margin: 20px;
}

#payment-btn {
	width: 100px;
	height: 40px;
	font-size: 25px;
}

</style>

<div id="wrap">

<div id="buy-head">주문서</div>

<form action="/store/order/item" method="post">

<input type="hidden" id="orderQuantity" name="orderQuantity" value="${orderProduct.orderQuantity }">
<input type="hidden" id="userid" name="userid" value="${param.userid }">
<input type="hidden" id="productNo" name="productNo" value="${viewProduct.productNo }">
<input type="hidden" id="totalPrice" name="totalPrice" value="${viewProduct.price * orderProduct.orderQuantity }">
<input type="hidden" id="totalOrderSum" name="totalOrderSum" value="${viewProduct.price * orderProduct.orderQuantity }">

<section id="shipping-info">
	<div style="width: 1024px;">
		<div>
			<div><label for="userName">이름</label></div>
			<div><input type="text" name="userName" id="userName" class="user-input form-control" placeholder="이름을 입력해주세요"></div>
		</div>
		<div>
			<div><label for="addr1">도로명 주소</label></div>
			<div><input type="text" name="addr1" id="addr1" class="user-input form-control" placeholder="도로명 및 번지"></div>
			<div><input type="text" name="addr2" id="addr2" class="user-input form-control" placeholder="상세 주소를 입력해주세요"></div>	
		</div>
		<div>
			<div><label for="phone">연락처</label></div>
			<div><input type="tel" name="phone" id="phone" class="user-input form-control" placeholder="연락처를 입력해주세요"></div>
		</div>
		<div>
			<div><label for="email">이메일</label></div>
			<div><input type="email" name="email" id="email" class="user-input form-control" placeholder="이메일을 입력해주세요"></div>
		</div>
		<div>
			<div><label for="memo">주문메모</label></div>
			<div><input type="text" name="memo" id="memo" class="user-input form-control" placeholder="주문메모를 입력해주세요"></div>
		</div>
	</div>
</section>
<section id="wrap-Purchase-info">
<div id="wrap-buy">
	<div>
		<div style="font-weight: bold;">주문 상품 내역</div>
		<div id="buy-title">${store.title }</div>
		<div id="buy-info">
		<div style="width: 20%;"><img src="<%=request.getContextPath() %>/upload/${viewProduct.productImg.storedName }" width="170" height="190"></div>
			<div style="width: 60%; margin-left: 30px;">
				<ul>
					<li style="margin-bottom: 20px;">상품명 : ${viewProduct.productName }</li>
					<li>구매 갯수 : ${orderProduct.orderQuantity }</li>
				</ul>
			</div>
			<div id="wrap-price" style="width: 20%; margin-left: 30px; ">
				<div>${viewProduct.productName } x ${orderProduct.orderQuantity }</div>
				<div>합계 : <fmt:formatNumber type="currency" value="${viewProduct.price * orderProduct.orderQuantity }"/></div>
			</div>
		</div>
	</div>
</div>
</section>
<section id="payment-info">
<div id="wrap-payment">
	<div id="total-order-sum">총계 : <fmt:formatNumber type="currency" value="${viewProduct.price * orderProduct.orderQuantity }"/></div>
	<div id="payment-tab">
		<div><input type="radio" name="paymentCla" value="무통장입금"><label>가상계좌 무통장입금</label></div>
		<div><input type="radio" name="paymentCla" value="계좌이체"><label>실시간 계좌이체</label></div>
		<div><input type="radio" name="paymentCla" value="카카오페이"><label>카카오페이 간편결제</label></div>
	</div>
</div>
</section>
<div id="wrap-payment-btn"><button type="button" class="btn" id="payment-btn">결제하기</button></div>
</form>
</div>

<%@	include file="../../layout/footer.jsp" %>