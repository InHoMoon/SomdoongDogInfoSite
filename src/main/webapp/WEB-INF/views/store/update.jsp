<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {

	//상품 상세정보 이미지 처리
	$("#product-img").change(function( e ) {
		
		var files = e.target.files;
		
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
			
			$("#write-content").html(
				$("<img>").attr({
					"src": data.target.result
				})
			)
		}
		reader.readAsDataURL( files[0] );
	})
	
	//상품 프로필 이미지 처리 
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
	
	// 버튼 submit 설정
	$("#update-btn").click(function() {
		
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
			window.location.replace("/store/detail?storeNo=${param.storeNo }");
		} else {
			return false;
		}
	});
});
</script>

<style type="text/css">
body {
	height: 100%;
}

#wrap-btn {
	margin-top: 30px;
}

#wrap-write {
	width: 1900px;
	height: auto;
	display: flex;
	justify-content: center;
}

#wrap-form {
	width: 1024px;
	
	margin-left: 25px;
	
	display: flex;
	justify-content: center;
}

#store-info > div {
	margin: 10px;
}

#store-info {
	width: 66%;
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

#product-profile-img > div > img {
	cursor: pointer;
}

#category {
	width: 90px;
	height: 30px;
}

textarea {
	width: 630px; height: 185px;
	resize: none;
}

#write-content {
	margin-top: 30px;

	display: flex;
	justify-content: center;
	
	border-top: 1px solid #d3d3d3;
}

#write-content > img {
	margin-top: 30px;
}

#store-category-productName {
	display: flex;
}

#wrap-btn {
	width: 1900px;

	display: flex;
	justify-content: center;
}

#wrap-button {
	width: 1024px;

	display: flex;
	justify-content: flex-end;
	margin-right: 25px;
}

button {
	width: 60px;
	height: 30px;
}

#cancel-btn {
	margin-left: 5px;
}

</style>

<div id="wrap-btn">
	<div id="wrap-button">
		<button id="update-btn">수정</button>
		<button id="cancel-btn" type="button">취소</button>
	</div>
</div>

<div id="wrap-write">


<form action="/store/update" method="post" enctype="multipart/form-data">

<input type="hidden" id="storeNo" name="storeNo" value="${viewStore.storeNo }">
	<div id="wrap-form">
		<div id="product-profile-img">
			<img src="<%=request.getContextPath() %>/upload/${profileImg.storedName }" class="img-rounded" width="340px" height="405px">
		</div>
		<div id="store-info">
			<div id="store-category-productName">
				<div>
					<select name="category" id="category">
						<option value="food">사료</option>
						<option value="snack">간식</option>
						<option value="medical">의료</option>
						<option value="toy">장난감</option>
					</select>
				</div>
				<div>
					<input type="text" name="productName" value="${viewStore.product.productName }" style="width: 530px; height: 30px; margin-left: 10px;" maxlength="20" readonly/>
				</div>
			</div>
			<div>
				<input type="text" name="title"	placeholder="제목을 입력하세요" style="width: 630px; height: 30px;" maxlength="30" value="${viewStore.title }">
			</div>
			<div>
				<textarea name="info" placeholder="내용을 입력하세요" maxlength="250">${viewStore.info }</textarea>
			</div>
			<div>
				<div>
					<input type="text" name="stock" value="${viewStore.product.stock }" style="width:100px; height: 30px; margin: -5px 0 8px 0;" readonly />
				</div>
				<div>
					<input type="text" name="price" value="${viewStore.product.price }" style="width: 250px; height: 30px;" readonly />
					<label style="font-size: 20px; margin-left: 2px;">원</label>
				</div>
				<div>
					<br><input type="file" id="product-img" name="file">
				</div>
			</div>
		</div>
	</div>
	<div id="write-content" style="margin-top: 20px;">
		<img src="<%=request.getContextPath() %>/upload/${productImg.storedName }">
	</div>
</form>

</div>

<%@	include file="../layout/footer.jsp" %>