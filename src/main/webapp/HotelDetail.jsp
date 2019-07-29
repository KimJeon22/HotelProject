<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[HotelDetail.jsp]</title>

<style type="text/css">
#htl_name {border-style:solid; background-color:lightblue;}
.htl_loca {font-size:13pt; color:green;}
#hc_htl_desc{margin: 40px 40x 40px 40px;}
#carousel_section
{
width:50%;
background-color:gray;
}

#hc_htl_grade{
position: fixed;
bottom:200px;
right:10px;
width:15%;
height:20%;
background:lightblue;
color:#5858FA;
font-size:20pt;
border: 5px solid lightgray;
}
#hc_htl_star{
color:orange;
width:10%
height:10%
}
#carousel_section>ul{
margin:0px;
padding:0px;
width:100%;
height:100%;
position:relative;
overflow:hidden;
}

#carousel_section>ul>li{
list-style:none;
width:100%;
height:100%;
position:absolute;

}
#carousel_section>ul>li>img{
list-style:none;
width:100%;
height:100%;
object-fit:cover;

}
</style>
</head>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/carousel.js"></script>
<link rel="stylesheet" type="text/css" href="../css/carousel.css">
 <script>
var time; // 슬라이드 넘어가는 시간
var $carouselLi;
var carouselCount; // 캐러셀 사진 갯수
var currentIndex; // 현재 보여지는 슬라이드 인덱스 값
var caInterval;

//사진 연결
var imgW; // 사진 한장의 너비	
$(document).ready(function(){

	carouselInit(500, 2000);
});

$(window).resize(function(){
	carousel_setImgPosition();
});

/* 초기 설정 */
function carouselInit( height, t ){
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

function carousel_setImgPosition(){
  
	imgW = $carouselLi.width(); // 사진 한장의 너비	
	// 이미지 위치 조정
	for(var i = 0; i < carouselCount; i++) 
	{
		if( i == currentIndex)
		{
			$carouselLi.eq(i).css("left", 0);
		} 
		else
		{
			$carouselLi.eq(i).css("left", imgW);
		}
	}
}

function carousel(){

	// 사진 넘기기
	// 사진 하나가 넘어간 후 다시 꼬리에 붙어야함
	// 화면에 보이는 슬라이드만 보이기
	caInterval = setInterval(function(){
		var left = "-" + imgW;

		//현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
		$carouselLi.eq(currentIndex).animate( { left: left }, function(){
			// 다시 오른쪽 (제자리)로 이동
			$carouselLi.eq(currentIndex).css("left", imgW);

			if( currentIndex == ( carouselCount - 1 ) )
			{
				currentIndex = 0;
			}
			else
			{
				currentIndex ++;
			}
		} );

		// 다음 슬라이드 화면으로
		if( currentIndex == ( carouselCount - 1 ) )
		{
			// 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
			$carouselLi.eq(0).animate( { left: 0 } );
		}
		else
		{
			$carouselLi.eq(currentIndex + 1).animate( { left: 0 } );
		}
	}, time);
}
</script>  
<!-- Body시작 -->
<body>


    <div id="htl_name">
    <h1>제주 신라 호텔</h1>
    </div>
    
   <div style="color: blue; font-size: 2.0em;">
         주소지:
    </div>
    
 	<div class="htl_loca">
    <p>중문관광로72번길 75, 서귀포, 대한민국</p><hr>
    </div>
   
 
<div id="carousel_section">
<ul>
<li><img src="${pageContext.request.contextPath}/resources/images/a1.jpg" width="150" height="200"></li>
<li><img src="${pageContext.request.contextPath}/resources/images/a2.jpg" width="150" height="200"></li>
<li><img src="${pageContext.request.contextPath}/resources/images/a3.jpg" width="150" height="200"></li>
<li><img src="${pageContext.request.contextPath}/resources/images/a4.jpg" width="150" height="200"></li>
<li><img src="${pageContext.request.contextPath}/resources/images/a5.jpg" width="150" height="200"></li>
</ul>
</div>
 
 
 
 

<div style="font-size: 12px;">
<div id="hc_htl_desc">
<strong>제주 신라 호텔 - &lt;5성급&gt; - </strong><br>
해변가가 내려다보이는 쉬리의 언덕이 유명한 제주 신라 호텔은 중문관광단지 내 자리하고 있어 여미지식물원, 천제연폭포, 별내린 전망대 등이 아주 가까운 거리에 있습니다.<br>
 또한, 제주국제공항은 차로 1시간 5분 거리에 있으며 1일 3회 호텔-공항 간 무료 셔틀을 운영하고 있습니다.<br>
호텔 내에 여유롭게 산책을 즐기기에 좋은 숨비정원이 있으며 사전 예약을 하시면 캠핑과 글램핑도 즐기실 수 있습니다. 또한, 짐보리클럽, 키즈아일랜드 등 아이들을 위한 <br>
다양한 시설이 완비되어 있으며 플레이스테이션 전 기종을 체험해볼 수 있는 플레이스테이션 존도 있습니다. 그 외에도 피트니스센터, 스파, 사우나, 미팅룸 등을 이용<br>
하실 수 있으며 기념품샵과 특산물 매장에서 쇼핑을 즐기실 수도 있습니다.38개의 스위트 객실을 포함한 429개 객실을 보유하고 있으며 객실에 따라 한라산 또는 바다를 감상하실 수 있습니다<br>
 또한, 모든 객실에 TV, 냉장고, 에어컨, 금고 등이 완비되어 있으며 욕실에는 욕실용품, 비데, 헤어드라이어 등이 있습니다.
호텔 내에 있는 한식, 일식, 뷔페 레스토랑이 있으며 <br>조식은 뷔페 레스토랑 파크뷰와 한식당인 천지에서 제공하고 있으며 별도의 요금이 발생합니다. 그 밖에도 로비 라운지와 풀사이드바를 운영하고 있습니다.
</div>

<div id="hc_htl_grade">
5성급 호텔입니다.
<span id="hc_htl_star">
★★★★★

</span>
</div>


</div>

 
  
    


</body>

</html>



