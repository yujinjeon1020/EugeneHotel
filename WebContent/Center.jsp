<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style>
* {
	box-sizing: border-box;
}

.slideshow-container {
	max-width: 100%;
	position: relative;
	margin: auto;
}

/* �̹��� �����̵� �Ѿ�� �ٸ� �̹��� ����� */
.mySlides {
	display: none;
}

/* �̹��� �����ϴ� ��Ʈ */
.dot {
	cursor: pointer;
	height: 10px;
	width: 10px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading �ִϸ��̼� */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}
}
</style>
<script>
	var slideIndex = 0; //slide index

	// HTML �ε尡 ���� �� ����
	window.onload = function() {
		showSlides(slideIndex);

		// �ڵ� �̹��� �����̵� - 3��
		var sec = 3000;
		setInterval(function() {
			slideIndex++;
			showSlides(slideIndex);

		}, sec);
	}

	// ����� �̹��� ��Ʈ��
	function currentSlide(n) {
		slideIndex = n;
		showSlides(slideIndex);
	}

	function showSlides(n) {

		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		var size = slides.length;

		if ((n + 1) > size) {
			slideIndex = 0;
			n = 0;
		} else if (n < 0) {
			slideIndex = (size - 1);
			n = (size - 1);
		}

		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}

		slides[n].style.display = "block";
		dots[n].className += " active";
	}
</script>
</head>
<body>
	<table>
		<div class="slideshow-container">

			<div class="mySlides fade">
				<img src="img/hotel_main2.jpg" width="100%">
			</div>

			<div class="mySlides fade">
				<img src="img/hotel_intro2.jpg" width="100%">
			</div>

			<div class="mySlides fade">
				<img src="img/hotel_intro4.jpg" width="100%">
			</div>

			<div class="mySlides fade">
				<img src="img/hotel_intro3.jpg" width="100%">
			</div>

			<!-- ���� �ѱ�� ��ư(��Ʈ) -->
			<div style="text-align: center">
				<span class="dot" onclick="currentSlide(0)"></span> <span
					class="dot" onclick="currentSlide(1)"></span> <span class="dot"
					onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>

	</table>
</body>
</html>