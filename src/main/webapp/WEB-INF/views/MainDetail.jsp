<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
 h2{
   font-size:30px;
   line-height:1.4em;
   background-color:#BCBABD;
   box-shadow: 0.1em 0 0 #BCBABD, -0.1em 0 0 #BCBABD 
 }
  
 td{
  font-size:30px;
 
 }
 
 table{
  width:100%;
  height:150px;
 }

</style>
</head>
<body>
<div align="center"><h2>header<h2> </div>
<!-- 1번째 섹션 -->
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Registration</h3>
				<jsp:include page="search2.jsp"></jsp:include>			
			</div>
		
			<div class="col-md-6">
				<h3 class="dark-grey">검색한  </h3>
				<img src="resources/images/hydran.png">
			</div>
		</div>
	</section>
</div>
<hr>
<!-- 2번째 섹션  -->
<div class="container-fluid">
    <section class="container">
		<div class="container-page">
		
		   <div class="col-md-6">
				<h2>지도</h2><br>							
			</div>
		
			<div class="col-md-6">
				<h3 class="dark-grey">List</h3>
				<img src="resources/images/hydran.png">
			</div>
		    				
			<div class="col-md-6">				 
				<h2>관광명소</h2><br>				
				<h3></h3> 
			    <hr>
			    <table>
			    <tr>
			      <td>속초</td>
			      <td>강릉</td>
			    </tr> 	
			    <tr>
			      <td>포항</td>
			      <td>울산</td>
			    </tr>
			     <tr>
			      <td>포항</td>
			      <td>울산</td>
			    </tr>			 
			    </table>	
			 		
			</div>
		
			<div class="col-md-6">
				<h3 class="dark-grey">Terms and Conditions</h3>
				<img src="resources/images/hydran.png">
			</div>
		</div>
	</section>
</div>

<div align="center"><h2>Footer<h2> </div>
</body>
</html>