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
			
			$("#product-profile-img").children().remove("#upload-icon");
			
			$("#product-profile-img").html(
				$("<img>").attr({
					"src": data.target.result
				})
			)
		}
		reader.readAsDataURL( files[0] );
	})
	
	if( ${empty updateProduct.productImg} ) {
		$("#upload-icon").show()
	} else {
		$("#profile-image").show()
	}
	
	$("#x-btn").click(function() {
		$("#profile-image").toggle()
		$("#upload-icon").toggle()
	})
	
// 	$("#upload-icon").click(function) {
// 		$("#x-btn").toggle()
// 	}
	
	$("#update-btn").click(function(){
		
		if(confirm("수정 하시겠습니까?") == true){
			alert("수정 되었습니다.");
			$("form").submit();
		} else {
			return false;
		}
	})
	
	$("#cancel-btn").click(function(){
		if( confirm("수정을 취소하시겠습니까?") == true ) {
			alert("수정이 취소되었습니다.");
			window.location.replace("/store/product/detail?productNo=${param.productNo }");
		} else {
			return false;
		}
	});
});
</script>

<style type="text/css">
h1, label, input, button {
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

#wrap-icon {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#wrap-img {
	width: 100%;
	height: 100%;
    
/* 	display: flex; */
/* 	align-items: center; */
/* 	justify-content: center; */
}

#upload-icon {
	width: 100px;
	height: 60px;
	cursor: pointer;
	
	display: none;
}

#profile-image {
	display: none;
}

#imgUpload {
	display: none;
}

#product-profile-info {
	width: 65%;
}

#product-name, #price, #stock {
	width: 550px;
	height: 30px;
	
	margin: 10px 0 10px 0;
}

#x-btn {
	width: 335px;
	position: absolute;

	font-size: 18px;
	
	cursor: pointer;
}

.btn {
	width: 60px;
	height: 40px;
	
	font-size: 25px;
}

</style>	

<div id="wrap-product-insert">


<div id="wrap-form">
	<form action="/store/product/update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="productNo" value="${param.productNo }">
	
	<div style="display: flex; margin-top: 100px;">
		<div id="product-profile-img">
			<div id="wrap-img">
			<div id="x-btn" style="display: flex; flex-direction: row-reverse;">x</div>
				<div>
					<img src="<%=request.getContextPath() %>/upload/${updateProduct.productImg.storedName }" id="profile-image" width="345px" height="410px">
				</div>
				<div id="wrap-icon">
					<img src="/resources/store_camera.png" id="upload-icon" alt="사진 업로드" onclick="$('#imgUpload').trigger('click')">
				</div>
			</div>
		</div>
		<input type="file" id="imgUpload" name="file" value="">
		<div id="product-profile-info">
		<h1 style="margin: -5px 0 20px 0;">상품 정보 수정</h1>
			<div>
				<div><label for="product-name">상품명</label></div>
				<input type="text" name="productName" id="product-name" placeholder="상품명을 입력하세요" value="${updateProduct.productName }">
			</div>
			<div>
				<div><label for="price">가격</label></div>
				<input type="text" name="price" id="price" placeholder="가격을 입력하세요" value="${updateProduct.price }">
			</div>
			<div>
				<div><label for="stock">재고</label></div>
				<input type="text" name="stock" id="stock" placeholder="재고를 입력하세요" value="${updateProduct.stock }">
			</div>
			<div id="wrap-btn" style="margin-top: 100px;">
				<button id="update-btn" class="btn">수정</button>
				<button id="cancel-btn" class="btn" type="button">취소</button>
			</div>
		</div>
	</div>
	</form>
</div>

</div>


<%@	include file="../../layout/footer.jsp"%>