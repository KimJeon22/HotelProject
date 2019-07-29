<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[예약 페이지]</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<!-- 상세검색 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<style type="text/css">
	.card-title{ font-size: large; }
	.card-text{ font-size: small; }
 	a{ color: white; }
 	a:link { color: blue; text-decoration: none;}
 	a:visited { color: blue; text-decoration: none;}
 	a:hover { color: blue; text-decoration: underline;}
 	
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  display: none;
  margin-left:600px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}
/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
}

</style>
</head>

<body>

	<!-- nav 화면 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="#">Navbar</a>
 	 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="#">Features</a>
      <a class="nav-item nav-link" href="#">Pricing</a>
      <a class="nav-item nav-link disabled" href="#">Disabled</a>
    </div>
  </div>
</nav>
	
	<!--  스티키 nav -->
		<nav class="navbar sticky-top navbar-light bg-light container" id="navbar">
  			<form class="form-inline">
    			<input class="form-control mr-sm-2" type="search" placeholder="지역 검색">
    			<input class="form-control mr-sm-2" type="date">
    			<input class="form-control mr-sm-2" type="date">
    			<input class="form-control mr-sm-2" type="search" placeholder="인원 수">
    			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  			</form>	
		</nav>

	<!--  container  -->
	<div class="container">
		<div class="row">

			<!-- 왼쪽 화면 -->
			<div class="col-4">
				<ul class="cd-accordion cd-accordion--animated margin-top-lg margin-bottom-lg">
					<li class="cd-accordion__item cd-accordion__item--has-children">
						<input class="cd-accordion__input" type="checkbox" name="group-1" id="group-1"> 
						<label class="cd-accordion__label" for="group-1"><span>호텔 이름</span></label>

						<ul class="cd-accordion__sub cd-accordion__sub--l1">
							<li class="cd-accordion__item cd-accordion__item--has-children">
								<div class="text-right">
									<input type="text" style="margin-right:15px;">
									<input type="button" style="margin-right:15px;" class="btn btn-primary" value="검색">
								 </div>
							</li>
						</ul>
					</li>

					<li class="cd-accordion__item cd-accordion__item--has-children">
						<input class="cd-accordion__input" type="checkbox" name="group-2" id="group-2"> 
						<label class="cd-accordion__label" for="group-2"><span>평점</span></label>
						<ul class="cd-accordion__sub cd-accordion__sub--l1">
							<li class="cd-accordion__label"> <input type="checkbox" name="rate" value="1"><font color="orange">★</font></li>
							<li class="cd-accordion__label"> <input type="checkbox" name="rate" value="2"><font color="orange">★★</font></li>
							<li class="cd-accordion__label"> <input type="checkbox" name="rate" value="3"><font color="orange">★★★</font></li>
							<li class="cd-accordion__label"> <input type="checkbox" name="rate" value="4"><font color="orange">★★★★</font></li>
							<li class="cd-accordion__label"> <input type="checkbox" name="rate" value="5"><font color="orange">★★★★★</font></li>
						</ul>
					</li>


					<li class="cd-accordion__item cd-accordion__item--has-children">
						<input class="cd-accordion__input" type="checkbox" name="group-3" id="group-3"> 
						<label class="cd-accordion__label" for="group-3"><span>1박당 가격</span></label>
							<ul class="cd-accordion__sub cd-accordion__sub--l1">
								<li class="cd-accordion__label"> <input type="checkbox" name="price" value="50000"> 0원 ~ 50,000원</li>
								<li class="cd-accordion__label"> <input type="checkbox" name="price" value="100000"> 50,000원 ~ 100,000원</li>
								<li class="cd-accordion__label"> <input type="checkbox" name="price" value="150000"> 100,000원 ~ 150,000원</li>
								<li class="cd-accordion__label"> <input type="checkbox" name="price" value="200000"> 150,000원 ~ 200,000원</li>
								<li class="cd-accordion__label"> <input type="checkbox" name="price" value="250000"> 200,000원 ~ 250,000원</li>
						</ul>
					</li>
					
					<li class="cd-accordion__item cd-accordion__item--has-children">
						<input class="cd-accordion__input" type="checkbox" name="group-4" id="group-4"> 
						<label class="cd-accordion__label" for="group-4"><span>장소</span></label>
							<ul class="cd-accordion__sub cd-accordion__sub--l1">
								<li class="cd-accordion__label"> <a href="#" > 강남</a></li>
								<li class="cd-accordion__label"> <a href="#" > 강남</a></li>
								<li class="cd-accordion__label"> <a href="#" > 강남</a></li>
								<li class="cd-accordion__label"> <a href="#" > 강남</a></li>
						</ul>
					</li>
					
					<li class="cd-accordion__item cd-accordion__item--has-children">
						<input class="cd-accordion__input" type="checkbox" name="group-5" id="group-5"> 
						<label class="cd-accordion__label" for="group-5"><span>주변 시설</span></label>
							<ul class="cd-accordion__sub cd-accordion__sub--l1">
								<li class="cd-accordion__label"> <input type="checkbox" name="facility" value="wifi">무료 와이파이 </li>
								<li class="cd-accordion__label"> <input type="checkbox" name="facility" value="breakfast">조식 </li>
								<li class="cd-accordion__label"> <input type="checkbox" name="facility" value="swimming_pool">수영장 </li>
								<li class="cd-accordion__label"> <input type="checkbox" name="facility" value="spa">스파</li>
								<li class="cd-accordion__label"> <input type="checkbox" name="facility" value="bbq">바베큐</li>
						</ul>
					</li>
					
				</ul>
			</div>

			<!--  오른쪽 화면  -->
			<div class="col-8">
			
			<c:forEach var="dto" items="${HL }" begin="${start }" end="${end }">
			<input type="hidden" id="num" value="${pageNum }">
			<div class="card mb-3 margin-top-lg" >
  				<div class="row no-gutters">
   					<div class="col-md-4">
      					<img src="${pageContext.request.contextPath}/resources/hotel_image/${dto.h_image}" class="card-img" height="200px" width="200">
    				</div>
    				<div class="col-md-8">
      					<div class="card-body">
        					<p class="card-title"><a href="HotelDetail.jsp">${dto.h_name }</a></p>
        					<p class="card-text">★★★ </p>
        					<p class="card-text">주소<br>${dto.h_adress }</p>
        					<p class="card-text">1인 ~ 최대 x인</p>
        					<div class="text-right"> 
        						<label class="card-title">최저가 10.000원</label> <br>
								<a href="booking.jsp"><input type="button" class="btn btn-success" value="예약하기"></a>
      						</div>
    					</div>
  					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		</div>
		<div class="loader"></div>
	</div>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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

	<!-- 상세검색 js -->
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	var $loader = $('.loader'); // 스피너 추가
	
    $(window).scroll(function() {
    	var maxHeight = $(document).height();
    	var currentScroll = $(window).scrollTop() + $(window).height();
    	var pageNum = parseInt($('#num').val())+1 ;
	    
     if (maxHeight <= currentScroll) {
    		
    		$.ajax({
    			type: 'GET', // get 방식으로 요청
    			url: "list.do", // 데이터를 불러오는 json-server 주소입니다 .
    			data : { "Gnum" : pageNum },
    			dataType: 'json', // json 타입
    			beforeSend : function(){ // 요청을 보내기전
    				$loader.show(); // 요청을 보내기전에 스피너를 보여줍니다.
    			}
    		})
    		
    		.done(function (data) { // 성공시 호출될 함수
				setTimeout(function () { // 1초의 딜레이를 주었습니다.
			    $spiner.hide(); // 요청이 마무리된후 스피너를 다시 가려줍니다.
			}, 2000);
		})
		
		.fail(function (err) { // 실패했을때 불러질 함수
			console.error('데이터 불러오기 실패');
		});
    		
    	}
    });
    
	</script>


</body>
</html>