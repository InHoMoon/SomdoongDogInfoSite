<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@	include file="../../layout/header.jsp"%>

<script type="text/javascript">
//상품 프로필 이미지 처리 
$(document).ready(function() {

	$("#imgUpload").change(function( e ) {
		
		var files = e.target.files;
		
		console.log( e.target.files )
		
		console.log( this.e )
		
		// 이미지 처리 검사
		if( !files[0].type.includes( "image" ) ) {
			alert("이미지가 아닙니다.")
			
			// 선택 파일 해제
			e.target.value = null;
			
			// 이벤트 처리 중단
			return false;
		}
		
		var reader = new FileReader();
		
		reader.onload = function( data ) {
			
			$("#product-profile-img").children().remove();
			
			$("#product-profile-img").html(
				$("<img>").attr({
					"src": data.target.result
				})
			)
		}
		reader.readAsDataURL( files[0] );
	})
	
	$("#insert-btn").click(function(){
		
		if( confirm("상품을 등록 하시겠습니까?") == true ) {
			alert("등록 되었습니다");
			$("form").submit();
		} else {
			return false;
		}
	});
	
	$("#cancle-btn").click(function(){
		
		if( confirm("작업중인 내용을 잃을수도 있습니다. 계속 하시겠습니까?") == true ) {
			window.location.replace("/store/product");
		} else {
			return false;
		}
	})
});
</script>

<style type="text/css">
h1, label, input {
	font-family: 'Dongle', sans-serif;
}

label {
	width: 90px;
	
	font-size: 25px;
	line-height: 10px;
}

input {
	font-size: 20px;
}

#wrap-product-insert {
	width: 1900px;
	height: 750px;
	
	display: flex;
	justify-content: center;
}

#wrap-form {
	width: 1024px;
	display: flex;
	justify-content: center;
}

#wrap-form > form {
	width: 100%;
}

#product-profile-img {
	border: 1px solid #d3d3d3;

	width: 34%;
	height: 410px;
	margin-right: 20px;
	
	display: flex;
    align-items: center;
    justify-content: center;
    
    overflow: hidden;
}

#product-profile-info {
	width: 65%;
}

#product-name, #price, #stock {
	width: 550px;
	height: 30px;
	
	margin: 10px 0 10px 0;
}

.btn {
	width: 60px;
	height: 40px;
	
	font-size: 25px;
	font-family: 'Dongle', sans-serif;
}

</style>	

<div id="wrap-product-insert">

<div id="wrap-form">
	<form action="/store/product/insert" method="post" enctype="multipart/form-data">
	<div style="display: flex; margin-top: 100px;">
		<div id="product-profile-img">
			<img src="/resources/store_camera.png" style="width: 100px; height: 60px; cursor: pointer;"
					 class="img-rounded" alt="사진 업로드" onclick="$('#imgUpload').trigger('click')">
		</div>
		<input type="file" id="imgUpload" style="display:none" name="file">
		<div id="product-profile-info">
		<h1 style="margin: -5px 0 20px 0;">상품 정보 등록</h1>
			<div>
				<div><label for="product-name">상품명</label></div>
				<input type="text" name="productName" id="product-name" placeholder="상품명을 입력하세요">
			</div>
			<div>
				<div><label for="price">가격</label></div>
				<input type="text" name="price" id="price" placeholder="가격을 입력하세요">
			</div>
			<div>
				<div><label for="stock">재고</label></div>
				<input type="text" name="stock" id="stock" placeholder="재고를 입력하세요">
			</div>
			<div id="wrap-btn" style="margin-top: 100px;">
				<button class="btn" id="insert-btn">등록</button>
				<button class="btn" id="cancle-btn" type="button">취소</button>
			</div>
		</div>
	</div>
	</form>
</div>

</div>


<%@	include file="../../layout/footer.jsp"%>