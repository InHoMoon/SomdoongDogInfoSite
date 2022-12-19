<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	//이미지 슬라이드 처리
	setInterval(next, 4000);
	
	var images;
	var image_count;
	var image_position = 1;
	
	images = $("#img-slide ul");
	image_count = images.children().length;
	
	function back() {
		if (1 < image_position) {
			images.animate({
				left:'+=1900px'
			});
			image_position--;
		}
	}
	
	function next() {
		
		if (image_count > image_position) {
			images.animate({
				left:'-=1900px'
			});
			image_position++;
		} else if ( image_position => image_count ) {
			
			image_position = 1;
			images.animate({
				left:'+=3800px'
			})
		}
	}
	
	//선택한 카테고리 페이지 표시
	
	$(".category-icon").click(function() {

		var id_check = $(this).attr("id");

		console.log(id_check);

		var url = "/store/" + id_check

		$.ajax({
			type : "POST",
			url : url,
			async : true,
			cache : "false",
			data : {id_check},
			dataType : "html",
			success : function(data) {
				console.log("ajax 성공")

				$("#list-content").children().remove();

				$("#list-content").html(data);
			},
			error : function() {
				console.log("ajax 실패")
			}
		})
	});
	
})

</script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#wrap-store-main {
	width: 100%;
	height: auto;
}

#img-banner {
	width: 1900px;
	height: 600px;
	position: relative;
	margin: 0 auto;
	overflow: hidden;
}

#img-slide > ul {
	position: absolute;
	left: 0;
	top: 0;
	width: 6000px;
	font-size: 0;
	transition: left 0.5s ease-out;
}

#img-slide > ul > li {
	display: inline-block;
}

#category-store {
	width: 1900px;
	display: flex;
	justify-content: center;
}

#category-main {
	width: 1024px;
	display: flex;
	justify-content: center;
}

#category-main > ul {
	float: left;
	margin: 40px;
}

.category-title {
	font-size: 30px;
	font-family: 'Dongle', sans-serif;

	text-align: center;
}

.category-icon {
	cursor: pointer;
}

.category-icon:hover {
	box-shadow: 2px 2px 10px #d3d3d3;
}

.category-icon > img {
	width: 150px;
	height: 150px;
}

#wrap-list-content {
	display: flex;
	justify-content: center;
}

#list-content {
	width: 1500px;
}

#list-content ul > li {
	width: 320px;
	
	font-family: 'Dongle', sans-serif;
}


</style>

<div id="wrap-store-main">
	<section id="img-banner">
		<div id="img-slide">
			<ul>
				<li class="slide"><img src="/resources/store_banner01.png" width="1900px" height="600px"></li>
				<li class="slide"><img src="/resources/store_banner02.png" width="1900px" height="600px"></li>
				<li class="slide"><img src="/resources/store_banner03.png" width="1900px" height="600px"></li>
			</ul>
		</div>
	</section>
	<section id="category-store">
		<div id="category-main">
			<ul>
				<li class="category-title">사료</li>
				<li class="category-icon" id="food"><img src="/resources/store_dogfood.png"></li>
			</ul>
			<ul>
				<li class="category-title">간식</li>
				<li class="category-icon" id="snack"><img src="/resources/store_dogsnack.png"></li>
			</ul>
			<ul>
				<li class="category-title">의료</li>
				<li class="category-icon" id="medical"><img src="/resources/store_dogmedical.png"></li>
			</ul>
			<ul>
				<li class="category-title">장난감</li>
				<li class="category-icon" id="toy"><img src="/resources/store_dogtoy.png"></li>
			</ul>
		</div>	
	</section>
	<section>
		<div id="wrap-list-content">
			<div id="list-content">
				<%@ include file="./all.jsp" %>
			</div>
		</div>
	</section>
</div>

<%@	include file="../layout/footer.jsp" %>