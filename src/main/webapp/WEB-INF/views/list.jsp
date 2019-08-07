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

<!-- map list -->


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

	<!--  Header -->
	<c:import url="/header.do"></c:import>
	
	<!--  스티키 nav -->
	<nav class="navbar sticky-top navbar-light bg-light container" id="navbar">
  			<form class="form-inline" method="get" action="list.do">
    			<input class="form-control mr-sm-2" type="text" id="adress" placeholder="지역 검색" name="h_adress" value="${adress }" >
    			<input class="form-control mr-sm-2" type="date" name="checkIn_date" value="${checkIn }">
    			<input class="form-control mr-sm-2" type="date" name="checkOut_date" value=${checkOut }>
    			<input class="form-control mr-sm-2" type="text" placeholder="인원 수">
    			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  			</form>	
		</nav> 

	<!--  container  -->
	<div class="container">
		<div class="row">

			<!-- 왼쪽 화면 -->
			<div class="col-4" >
			
				<ul class="cd-accordion cd-accordion--animated margin-top-lg margin-bottom-lg"> </ul>
			<div id="map" style="width:100%;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2233c89c1a9b498cab20c04239e70ef7"></script>	
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(35.907757, 127.76692200000002), // 지도의 중심좌표
					        level: 13 // 지도의 확대 레벨
					    };
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					</script>
					<c:forEach var="dtto" items="${mplist}">
					<script>
					// 마커가 표시될 위치입니다 
					var title = '${dtto.h_name}';
					var markerPosition  = new kakao.maps.LatLng('${dtto.m_lat}', '${dtto.m_long}'); 
				
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						title:title,
					    position: markerPosition
					});
					
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
					// marker.setMap(null);    
					</script>
					</c:forEach>		
			</div>

			<!--  오른쪽 화면  -->
			<div class="col-8">
			<c:forEach var="dto" items="${HL }" begin="${start }" end="${end }">
			<div class="card mb-3 margin-top-lg" >
  				<div class="row no-gutters">
   					<div class="col-md-4">
      					<img src="${pageContext.request.contextPath}/resources/hotel_image/${dto.h_image}" class="card-img" height="250px" width="200">
    				</div>
    				<div class="col-md-8">
      					<div class="card-body">
        					<p class="card-title"><a href="detail.do?Gidx=${dto.h_id}">${dto.h_name}</a></p>
        					<c:forEach begin="1" end="${dto.h_rate }" step="1">
								<font color="orange"> <label id=text>★</label></font>
							</c:forEach>
        					<p class="card-text">주소<br>${dto.h_adress }</p>
        					<p class="card-text">1인 ~ 최대 x인</p>
        					<div class="text-right"> 
        						<span style="font-size:small;" id="day" value="${day }">${day }박당가격</span><br>
        						<c:set var="day" value="${day }" />
        							<c:choose>
        								<c:when test="${day > 1}">
											<label class="card-title" >최저가 ${dto.r_price * day}원</label> <br>
										</c:when>
										<c:when test="${day eq 1}">
											<label class="card-title" >최저가 ${dto.r_price}원</label> <br>
										</c:when>
									</c:choose>
								<a href="detail.do?Gidx=${dto.h_id}&checkIn_date=${checkIn }&checkOut_date=${checkOut }&day=${day }">
								<input type="button" class="btn btn-success" value="예약하기"></a>
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
	var page = 1;
	var adress = $('#adress').val();
	var rateVal = 5;
    var price_append, rate_append="";
    
	//checkbox 이벤트 감지 (상세 검색에서 사용)
	
	$('input[name="rate"]').change(function() {
		rateVal = $(this).val();
		var checkedRate = $(this).prop('checked');
		if( checkedRate == true) rateVal= $(this).val();
		else rateVal = 5;
		console.log(rateVal);
		$('.col-8').empty();
		ajax();
	});
	
	
    $(window).scroll(function() {
    	var maxHeight = $(document).height();
    	var currentScroll = $(window).scrollTop() + $(window).height();
     if (maxHeight == currentScroll) {
    		page++;
    		ajax();
     } // if end
    }); // function end
    
    function ajax(){
		$.ajax({
			type: 'GET', // get 방식으로 요청
			url: "list.ajax", // 데이터를 불러오는 json-server 주소입니다 .
			data : { "Gnum" : page, "adress" : adress, "rate" : rateVal },
			dataType: 'json', // json 타입
		
		success:function(data) { // 성공시 호출될 함수
				
			console.log(data);
				if(data.length < 1 ){  console.log("데이타음슴")}
				else{
					
				for(var i=0; i< data.length; i++){
				//append 최저가 부분
				<c:forEach var="dto" items="${HL }" begin="${data[0].start}" end="${data[0].end}" >
			    	<c:set var="day" value="${day }" />
						<c:choose>
							<c:when test="${day > 1}">
								price_append = "<label clas='card-title'> 최저가"+data[i].r_price * ${day}+"원</label> <br>";
							</c:when>
							<c:when test="${day eq 1}">
								price_append = "<label class='card-title'>최저가"+data[i].r_price+"원</label> <br>";
							</c:when>
						</c:choose>
					</c:forEach>
				
					
				//append 별점부분
				for(var j=0; j<data[i].h_rate; j++){
					rate_append += "<font color='orange'> <label id=text>★</label></font>";	
				}				
				
		    	$('.col-8').append(
		   				"<div class='card mb-3 margin-top-lg' >"
						+"<div class='row no-gutters'>"
						+"<div class='col-md-4'>"
						+"<img src='${pageContext.request.contextPath}/resources/hotel_image/"+data[i].h_image+"' class='card-img' height='250px' width='200'></div>"
						+"<div class='col-md-8'><div class='card-body'>"
						+"<p class='card-title'><a href='detail.do?Gidx="+data[i].h_id+"&checkIn_date=${checkIn }+&checkOut_date=${checkOut }&day=${day }'>"+data[i].h_name+"</a></p>"
						+rate_append
						+"<p class='card-text'>주소<br>"+data[i].h_adress+"</p><p class='card-text'>1인 ~ 최대 x인</p>"
						+"<div class='text-right'> <span style='font-size:small;'>"+${day}+"박당가격</span><br>"
						+price_append
						+"<a href='detail.do?Gidx="+data[i].h_id+"&checkIn_date=${checkIn }+&checkOut_date=${checkOut }&day=${day }'><input type='button' class='btn btn-success' value='예약하기'></a>"
						+"</div></div></div></div></div>"
		   				);
		    	rate_append="";
		    	
				}//for end
			} // else end
		}, // success end
		error:function(request,status,error){
			console.log(error);
       } // error end
	}); // ajax end
 } // ajax function end
	</script>
</body>

</html>