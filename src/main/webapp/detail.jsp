<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[예약 페이지]</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/carousel.js"></script>
<link rel="stylesheet" type="text/css" href="../css/carousel.css">

<style type="text/css">
label, #col-8 {
	font-size: 25px;
}

#htl_name {
	font-size: 18pt;
	border-style: solid;
	background-color: lightblue;
}

.htl_loca {
	font-size: 13pt;
	color: green;
}

#hc_htl_desc {
	margin: 40px 40x 40px 40px;
}

#carousel_section {
	width: 50%;
	background-color: gray;
}

#hc_htl_grade {
	position: fixed;
	bottom: 200px;
	right: 10px;
	width: 15%;
	height: 20%;
	background: lightblue;
	color: #5858FA;
	font-size: 20pt;
	border: 5px solid lightgray;
}

#hc_htl_star {
	color: orange;
	width: 10% height:10%
}

#carousel_section>ul {
	margin: 0px;
	padding: 0px;
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
}

#carousel_section>ul>li {
	list-style: none;
	width: 100%;
	height: 100%;
	position: absolute;
}

#carousel_section>ul>li>img {
	list-style: none;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>


<script>
	var time; // 슬라이드 넘어가는 시간
	var $carouselLi;
	var carouselCount; // 캐러셀 사진 갯수
	var currentIndex; // 현재 보여지는 슬라이드 인덱스 값
	var caInterval;

	//사진 연결
	var imgW; // 사진 한장의 너비	
	$(document).ready(function() {

		carouselInit(500, 2000);
	});

	$(window).resize(function() {
		carousel_setImgPosition();
	});

	/* 초기 설정 */
	function carouselInit(height, t) {
		/*
		 * height : 캐러셀 높이
		 * t : 사진 전환 간격 
		 */

		time = t;
		$("#carousel_section").height(height); // 캐너셀 높이 설정
		$carouselLi = $("#carousel_section > ul >li");
		carouselCount = $carouselLi.length; // 캐러셀 사진 갯수
		currentIndex = 1; // 현재 보여지는 슬라이드 인덱스 값
		carousel_setImgPosition();
		carousel();
	}

	function carousel_setImgPosition() {

		imgW = $carouselLi.width(); // 사진 한장의 너비	
		// 이미지 위치 조정
		for (var i = 0; i < carouselCount; i++) {
			if (i == currentIndex) {
				$carouselLi.eq(i).css("left", 0);
			} else {
				$carouselLi.eq(i).css("left", imgW);
			}
		}
	}

	function carousel() {

		// 사진 넘기기
		// 사진 하나가 넘어간 후 다시 꼬리에 붙어야함
		// 화면에 보이는 슬라이드만 보이기
		caInterval = setInterval(function() {
			var left = "-" + imgW;

			//현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
			$carouselLi.eq(currentIndex).animate({
				left : left
			}, function() {
				// 다시 오른쪽 (제자리)로 이동
				$carouselLi.eq(currentIndex).css("left", imgW);

				if (currentIndex == (carouselCount - 1)) {
					currentIndex = 0;
				} else {
					currentIndex++;
				}
			});

			// 다음 슬라이드 화면으로
			if (currentIndex == (carouselCount - 1)) {
				// 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
				$carouselLi.eq(0).animate({
					left : 0
				});
			} else {
				$carouselLi.eq(currentIndex + 1).animate({
					left : 0
				});
			}
		}, time);
	}
</script>


</head>
<body>

	<div class="container">
		<h1>호텔이름~</h1>
		<div>
			<div class="row">
				<div class="col-8">
					<img src="${pageContext.request.contextPath}/resources/images/a1.jpg"
						width="100%" height="200">
				</div>
				<div class="col-4">
					<div>
						<label>주소:</label>
						<p>가져와</p>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div>
				<div>호텔 설명~</div>
				<div>부대시설~</div>
			</div>
			<div class="row">
				<div class="col">
					<div>객실정보~~</div>
				</div>
				<div class="col">
					<div>
						<a href="#">예약하기</a>
					</div>
				</div>

			</div>
		</div>


		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
</body>
</html>