<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 디테일메인화면css -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- card css -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<!-- Daum Map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2233c89c1a9b498cab20c04239e70ef7"></script>

<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	function aa(Gidx){
		var a=$('.date1').val();
		var b=$('.date2').val();
		location.href="aa.do?Gidx="+Gidx+"&checkIn_date="+a+"&checkOut_date="+b; 
	}
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>

<style>
 .dark-grey{
   font-size:30px;
   line-height:1.4em;
   background-color:#BCBABD;
   box-shadow: 0.1em 0 0 #BCBABD, -0.1em 0 0 #BCBABD 
 }
   
 .td{
  font-size:30px;   
 }
 
 .table{
  width:100%;
  height:150px;
 }
 
 .img {width:100%;}
.car-image-block {padding:0px;margin:0px;}
.car-image-block img {min-height: 200px; overflow: hidden;}
.crane-image-block {padding:0px;margin:0px;}
.crane-list-img img {min-height: 200px; overflow: hidden;}
 
 .cars-horizon{
  width: 1100px;
 }
 
 .col-md-9{
  width: 300px;
 }
 
 .span{
  font-size:10px;
 }
 
.btn btn-outline-danger{
   width: 50%; 
 }
 
 /* Style the footer */
.footer {
  background-color: #006BAB;
  padding: 30px;
  text-align: center;
  font-size:14px;
  color:white;
}
 
</style>

</head>

<body >

<!--  Header -->
   <c:import url="/header.do"></c:import>
   
<!-- 1번째 섹션 -->
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Registration</h3>
				<jsp:include page="search.jsp"></jsp:include>			
			</div>
		
			<div class="col-md-6">
			 <h3 class="dark-grey"><b>검색한 지역 [ ${LG.t_area} ]</b></h3><p>
				<img class="img" src="resources/tour_image/${LG.t_image}" width="600" height="470">	
			</div>
		</div>
	</section>
</div>



<hr style="align:center; width:57%">
<!-- 2번째 섹션  -->


<div class="container-fluid">
    <section class="container">
		<div class="container-page">
		
		   <div class="col-md-6">
				<h2 class="dark-grey">지도</h2><br>
				<div id="map" style="width:100%;height:350px;"></div>

			  
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng('${w}', '${k}'), // 지도의 중심좌표
					        level: 6 // 지도의 확대 레벨
					    };
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					</script>
					<c:forEach var="dto" items="${mt}">
					<script>
					// 마커가 표시될 위치입니다 	
					 var title = '${dto.h_name}';
					 var markerPosition  = new kakao.maps.LatLng('${dto.m_lat}', '${dto.m_long}'); 
					
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						title: title,
					    position: markerPosition
					});
					
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
					// marker.setMap(null);	
				</script>
			</c:forEach>
			</div>	
			<div class="col-md-6">				 
				<h2 class="dark-grey">관광명소</h2><br>				
			    <table class="table">
			    <tr>			    	   
			      <td class="td">${A}</td>
			      <td class="td">${B}</td>				
			    </tr> 
			    <tr>
			      <td class="td">${C}</td>
			      <td class="td">${D}</td>
			    </tr>		 
			    </table>
			    <hr>
			    <tr><td class="td"><font size="4"><b>${LG.t_content}</b></font></td></tr>
			    <hr>				 		
			</div>
							
			<div class="col-md-6">
				<h2 class="dark-grey">List</h2>
				<!-- card -->
				
				<div class="cars-horizon">
				    <div class="container">
				        <div class="row">
				          <div class="col-md-9">				           
				              <c:forEach var="dt" items="${HG}" begin="0" end="8"> 
				                <div class="row border">				                 
				                    <div class="col-md-4 car-image-block">
				                        <a href="#"><img class="img" src="${pageContext.request.contextPath}/resources/hotel_image/${dt.h_image}"></a>
				                    </div>
				                    <div class="col-md-8 card-body ">				        
				                        <span class="span"><h3>${dt.h_name}</h3></span><p></p>				                        
				                         <sapn><h4>주소: ${dt.h_adress}</h4></sapn>
				                        <ul class="list-inline">
				                             <li class="list-inline-item"><h4>1인 - 최대 x인</h4></li><br><br>				                     
				                             <li class="list-inline-item"><h5>1박당 가격</h5></li><br><br>
				                             <li class="list-inline-item"><h3>최저가:${dt.r_price} </h3></li>
				                        </ul>
				                        <button type="button" class="btn btn-outline-danger" onclick="aa(${dt.h_id})"><b>상품보기</b></button>
				                     </div>   
				                    </div>            
				                 </c:forEach>				                        				                          
				            </div>			           
				        </div>        
				    </div>
				</div>				
			</div>			
		</div>
	</section>
</div>
<br><br><hr>
<!-- footer -->
<div class="footer">
  	<p>© <span>2018</span> <a href="#" class="transition">KnightRider7660</a> All rights reserved.</p>
</div>


</body>
</html>