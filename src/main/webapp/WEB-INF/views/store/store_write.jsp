<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>
<script type="text/javascript">
$(document).ready(function() {

	$("#product-content").change(function( e ) {
		
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
			
			$("#product-img").children().remove();
			
			$("#product-img").html(
				$("<img>").attr({
					"src": data.target.result
				})
			)
		}
		reader.readAsDataURL( files[0] );
	})
	
	$("#write-btn").click(function() {
		
		$("form").submit();
	})
});
</script>

<style type="text/css">
body {
	height: 100%;
}

#wrap-write {
	width: 1900px;
	height: 100%;
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

#product-img {
	border: 1px solid #d3d3d3;

	width: 34%;
	height: 410px;
	margin-right: 20px;
	
	display: flex;
    align-items: center;
    justify-content: center;
    
    overflow: hidden;
}

#product-img > div > img {
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

#write-btn {}

#cancel-btn {
	margin-left: 5px;
}

</style>

<h1>게시글 작성</h1>
<hr>
<div id="wrap-btn">
	<div id="wrap-button">
		<button id="write-btn">등록</button>
		<button id="cancel-btn">취소</button>
	</div>
</div>

<div id="wrap-write">


<form action="./write" method="post" enctype="multipart/form-data">
	<div id="wrap-form">
		<div id="product-img">
			<a href="javascript:void(0);" onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn">
			<img src="/resources/store_camera.png" width="100px" height="60px" alt="사진 업로드">
			</a>
			<input type="file" id="imgUpload" style="display:none">
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
					<input type="text" name="productName" placeholder="상품명을 입력하세요" style="width: 530px; height: 30px; margin-left: 10px;">
				</div>
			</div>
			<div>
				<input type="text" name="title"	placeholder="제목을 입력하세요" style="width: 630px; height: 30px;">
			</div>
			<div>
				<textarea name="info" placeholder="내용을 입력하세요"></textarea>
			</div>
			<div>
				<div>
					<input type="text" name="stock" placeholder="재고 입력" style="width:100px; height: 30px; margin: -5px 0 8px 0;">
				</div>
				<div>
					<input type="text" name="price" placeholder="가격을 입력하세요" style="width: 250px; height: 30px;">
					<label style="font-size: 20px; margin-left: 2px;">원</label>
				</div>
				<div>
					<br><input type="file" id="product-content" name="file">
				</div>
			</div>
		</div>
	</div>
	<div id="write-content" style="margin-top: 20px;"></div>
</form>

</div>

<%@	include file="../layout/footer.jsp" %>