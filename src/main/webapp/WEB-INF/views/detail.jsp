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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sora.css">
</head>
<body>
	<!--  Header -->
	<c:import url="/header.do"></c:import>

	<div class="container">
		<h1>${bdto.h_name}</h1>
		<div>
			<div class="row">
				<div class="col-8">
					<img
						src="${pageContext.request.contextPath}/resources/hotel_image/${bdto.h_image}"
						width="100%" height="200">
				</div>
				<div class="col-4">
					<div>
						<label>주소:</label>
						<p>${bdto.h_adress}</p>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div>내용:${bdto.h_content}</div>
		</div>

		<!--  체크인 체크아웃 검색 부분 -->
		<div class="search">
			<form method="get" action="list.do" class="form-inline">
				<div class="form-row">
					<div class="form-group col-md-4">
						<label for="checkin">체크인</label> 
						<input id="date" class="date1" type="date" name="CheckIn_date" value="${checkIn }" disabled>
					</div>
					<div class="form-group col-md-4">
						<label for="checkout">체크아웃</label> 
						<input id="date" class="date2" type="date" name="CheckOut_date" value="${checkOut }" disabled>
					</div>
					<div class="form-group col-md-2">
						<label for="name"> 몇 일</label><br> 
						<input id="country" type="text" name="" value="${day }박 ${day + 1}일" disabled>
					</div>
					<div class="form-group col-md-2">
						<label for="name">인원수</label><br> 
						<input id="country" type="text" name="">
					</div>
				</div>
			</form>
		</div>



		<!--  객실 테이블 -->
		<table class="table">
			<thead>
				<tr align="left">
					<th scope="col">객실 이름</th>
					<th scope="col">정원</th>
					<th scope="col">가격</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${rdto}">
					<tr align="left">
						<td><h3>${dto.r_name}</h3> <br>서비스정보 :
							<p>${dto.r_service}</p></td>
						<td>${dto.r_inwon}</td>
						<td>${dto.r_price}</td>
						<td><a href="booking.do?h_id=${dto.r_id }"
							class="btn btn-primary">예약하기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:import url="/rselect.do?Gidx=${bdto.h_id}"/>		
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
</body>
</html>