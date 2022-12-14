<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	
	setInterval(next, 2000);
	
	var images;
	var image_count;
	var image_position = 1;
	
	images = $("#img-slide ul");
	image_count = images.children().length;
	
	$('#back').click(function () {
		back();
	});
	
	$('#next').click(function () {
		next();
	});
	
	function back() {
		if (1 < image_position) {
			images.animate({
				left:'+=1900px'
			});
			image_position--;
		}
	}
	
	function next() {
		
		var allSlide = $('.slide')
		
		if (image_count > image_position) {
			images.animate({
				left:'-=1900px'
			});
			image_position++;
		}
		
	}
	if ( image_position >= (".slide").length-1 ){
		$("#img-slide ul").animate({
			"left":0
		})
	}
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
	height: 100vh;
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

#next {
	font-size: 30px;

	position: absolute;
	top: 300px;
	right: 0;
	cursor: pointer;
	z-index: 1;
}

#back {
	font-size: 30px;

	position: absolute;
	top: 300px;
	left: 0;
	cursor: pointer;
	z-index: 1;
}

</style>

<div id="wrap-store-main">
	<section id="img-banner">
		<div id="img-slide">
			<div id="back">&lt;</div>
			<ul>
				<li class="slide"><img src="/resources/banner01.png" width="1900px" height="600px"></li>
				<li class="slide"><img src="/resources/banner02.png" width="1900px" height="600px"></li>
				<li class="slide"><img src="/resources/banner03.png" width="1900px" height="600px"></li>
			</ul>
			<div id="next">&gt;</div>
		</div>
	</section>
	<section id="category-icon">
		<div>
		</div>	
	</section>
</div>

<%@	include file="../layout/footer.jsp" %>