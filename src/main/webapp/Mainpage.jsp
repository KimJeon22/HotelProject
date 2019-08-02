<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainpage</title>
<!-- 메인페이지 구성css  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!--모든호텔을 한눈에비교 광고창  -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!--  -->
<style>
<!------ 기본 header footer content ---------->
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
.header {
  background-color: #f1f1f1;
  padding: 0px;
  text-align: center;
  font-size: 35px;
}

/* Style the footer */
.footer {
  background-color: #f1f1f1;
  padding: 10px;
  text-align: center;
}

/* 검색 옵션 화면 */
.content {
  background-color: #03a8f9;
  padding-left:500px;
  padding-top:30px;
  
  height: 500px; /* Should be removed. Only for demonstration */
}

#img{
  padding-top : 60px;
}

#main{
   float:left;
}

/*모든호텔을 한눈에비교 광고창 */
@import url('https://fonts.googleapis.com/css?family=Josefin+Sans:100,300,400,600,700');

body{
    background: #f2f2f2; 
    font-family: 'Josefin Sans', sans-serif;
}

h3{
     font-family: 'Josefin Sans', sans-serif;
}

.box{
    padding:60px 0px;
}

.box-part{
    background:#FFF;
    border-radius:10px;
    padding:60px 10px;
    margin:30px 0px;
}

.box-part:hover{
    background:#4183D7;
}

.box-part:hover .fa , 
.box-part:hover .title , 
.box-part:hover .text ,
.box-part:hover a{
    color:#FFF;
    -webkit-transition: all 1s ease-out;
    -moz-transition: all 1s ease-out;
    -o-transition: all 1s ease-out;
    transition: all 1s ease-out;
}

.text{
    margin:20px 0px;
}

.fa{
     color:#4183D7;
}


/*인기여행지 이미지나열 */
.image{
     padding:5px 2px 0 400px
     vertical-align: middle;
}

.jb-text {
				padding: 5px 10px;
				background-color: #005EA5;
				text-align: center;
				color: black;
				font-weight: bold;
				opacity: 0.5;
				font-weight: bold;
                color: white;
			}

</style>
</head>
<body>

<!--  Header -->
   <c:import url="/header.do"></c:import>

<!-- 검색옵션 -->
<div class="content" >
   <div id="main">
      <jsp:include page="search2.jsp"></jsp:include> 
   </div> 
<div id="img"> 
      <img src="resources/images/hotel.png"></div>
</div>

<!-- 모든호텔을 한눈에비교 -->
<div class="box">
    <div class="container">
     	<div class="row">
     	  <div class="container">
	           <hr>
          </div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
                        
                        <i class="fa fa-pinterest-p fa-3x" aria-hidden="true"></i>
                        
						<div class="title">
							<h3>한눈에 비교</h3>
						</div>
                        
						<div class="text">
							<span>전세계 269만개의 호텔을 한번에 비교하여 마음에 쏙 드는 호텔을 예약하세요</span>
						</div>             
					 </div>
				</div>	 
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
					    
					    <i class="fa fa-google-plus fa-3x" aria-hidden="true"></i>
                    
						<div class="title">
							<h3>최저가 보장</h3>
						</div>
                        
						<div class="text">
							<span>예약수수료가 없습니다.<br>
							호텔스컴바인이 고객님들께 드리는 약속입니다.</span>
						</div>
                        					                       
					 </div>
				</div>	 
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
                        
                        <i class="fa fa-github fa-3x" aria-hidden="true"></i>
                        
						<div class="title">
							<h3>즐거운 여행의 시작</h3>
						</div>
                        
						<div class="text">
							<span>작년 4억명에 여행자가 호텔스컴바인에서  <br> 최고의 호텔상품을 검색했습니다.</span>
						</div>
                        
					 </div>
				</div>		
		</div>		
    </div>
</div>

<!-- 광고창  -->
      <div class="container">
        <hr>
          <div class="row">
             <div class="hc-promopanel">
                    <a class="hc-promopanel__tile" href="http://naver.me/5DPwcCuQ" target="_blank" data-track="promoCarousel--0">
                        <img title="" alt="" src="https://cdn.datahc.com/content/images/desktop/main/promo-banners/kr-1.jpg?cdn=1.0.2019.212001-Cdbc2248f7aa2d3b92c842981c1bf36c8c6b6edb6">
                    </a>
                    <a class="hc-promopanel__tile" href="http://naver.me/GorsFu3S" target="_blank" data-track="promoCarousel--1">
                        <img title="" alt="" src="https://cdn.datahc.com/content/images/desktop/main/promo-banners/kr-2.jpg?cdn=1.0.2019.212001-Cdbc2248f7aa2d3b92c842981c1bf36c8c6b6edb6">
                    </a>
                    <a class="hc-promopanel__tile" href="http://www.discoverhongkong.com/kr/plan-your-trip/latest-promotion/special-kids-offer.jsp" target="_blank" data-track="promoCarousel--2">
                        <img title="" alt="" src="https://cdn.datahc.com/content/images/desktop/main/promo-banners/kr-3.jpg?cdn=1.0.2019.212001-Cdbc2248f7aa2d3b92c842981c1bf36c8c6b6edb6">
                    </a>
             </div>
           </div>
   </div>
  <br>
<!-- 인기여행지 이미지나열 -->
  <div class="container">
    <hr>
  <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">인기여행지</h1>

  <hr class="mt-2 mb-5">

  <div class="row text-center text-lg-left">

    <div class="col-lg-3 col-md-4 col-6">
     
      <a href="tourSearch.do?timg=a.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/a.jpg" style="height:200px;">
            <div class="jb-text"> <p>Seoul</p> </div>
          </a>
       
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=b.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/b.jpg" style="height:200px;">
             <div class="jb-text"> <p>Buyeo</p> </div>
          </a>
    </div>
    
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=c.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/c.jpg" style="height:200px;">
             <div class="jb-text"> <p>Jeju</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=d.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/d.jpg" style="height:200px;">
            <div class="jb-text"> <p>Ansung</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=e.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/e.jpg" style="height:200px;">
            <div class="jb-text"> <p>Andong</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=g.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/f.jpg" style="height:200px;">
            <div class="jb-text"> <p>Gyeongju</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=g.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/g.jpg" style="height:200px;">
            <div class="jb-text"> <p>Tongyeong</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=h.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/h.jpg" style="height:200px;">
            <div class="jb-text"> <p>Daejeon</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=i.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/i.jpg" style="height:200px;">
            <div class="jb-text"> <p>Boseong</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=j.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/j.jpg" style="height:200px;">
            <div class="jb-text"> <p>Namhae</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=k.png" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/k.png" style="height:200px;">
            <div class="jb-text"> <p>Busan</p> </div>
          </a>
    </div>
    <div class="col-lg-3 col-md-4 col-6">
      <a href="tourSearch.do?timg=c.jpg" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="resources/tour_image/l.jpg" style="height:200px;">
            <div class="jb-text"> <p>Gochang</p> </div>
          </a>
    </div>
  </div>

</div>
<!-- footer -->
<div class="footer">
  <p>Footer</p>
</div>

</body>
</html>