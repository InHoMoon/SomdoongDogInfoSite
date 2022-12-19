<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../../layout/header.jsp" %>

<style type="text/css">
#wrap {
	width: 1900px;
	height: 100%;
	
	margin-top: 20px;
	
	font-family: 'Dongle', sans-serif;
	font-size: 25px;
}

#but-title {
	font-size: 40px;
	text-align: center;
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

#shipping-info {
	display: flex;
	justify-content: center;
}

#buy-title {
	width: 1024px;
	background-color: #EBB99D;
}

#buy-info {
	height: 100px;

	background-color: #EDD99F;
	
	display: flex;
}

.user-input {
	width: 1024px;
	margin-bottom: 10px;
}

#payment-info {
	display: flex;
	justify-content: center;
}

#wrap-payment {
	width: 1024px;
}

</style>

<div id="wrap">

<div id="but-title">주문서</div>

<form action="" method="post">

<section id="shipping-info">
	<div style="width: 1024px;">
		<div>
			<div><label for="userName">이름</label></div>
			<div><input type="text" name="userName" id="userName" class="user-input" placeholder="이름을 입력해주세요"></div>
		</div>
		<div>
			<div><label for="">도로명 주소</label></div>
			<div><input type="text" name="addr1" id="addr1" class="user-input" placeholder="도로명 및 번지"></div>
			<div><input type="text" name="addr2" id="addr2" class="user-input" placeholder="상세 주소를 입력해주세요"></div>	
		</div>
		<div>
			<div><label for="phone">연락처</label></div>
			<div><input type="tel" name="phone" id="phone" class="user-input" placeholder="연락처를 입력해주세요"></div>
		</div>
		<div>
			<div><label for="email">이메일</label></div>
			<div><input type="email" name="email" id="email" class="user-input" placeholder="이메일을 입력해주세요"></div>
		</div>
		<div>
			<div><label for="memo">주문메모</label></div>
			<div><input type="text" name="memo" id="memo" class="user-input" placeholder="주문메모를 입력해주세요"></div>
		</div>
	</div>
</section>
<section id="wrap-Purchase-info">
<div id="wrap-buy">
	<div>
		<div style="font-weight: bold;">주문 상품 내역</div>
		<div id="buy-title">스토어 타이틀</div>
		<div id="buy-info">
		<div style="width: 20%;">상품 이미지</div>
			<div style="width: 60%;">
				<ul>
					<li>상품명</li>
					<li>구매 갯수</li>
				</ul>
			</div>
			<div style="width: 20%">가격</div>
		</div>
	</div>
</div>
</section>
<section id="payment-info">
<div id="wrap-payment">
	<div>총계</div>
	<div>
		<div><input type="radio" name="payment"><label>가상계좌 무통장입금</label></div>
		<div><input type="radio" name="payment"><label>실시간 계좌이체</label></div>
		<div><input type="radio" name="payment"><label>카카오페이 간편결제</label></div>
	</div>
</div>
</section>
</form>

</div>

<%@	include file="../../layout/footer.jsp" %>