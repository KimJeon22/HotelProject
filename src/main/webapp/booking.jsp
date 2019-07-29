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

<style type="text/css">
label,#col-8{
	font-size: 25px;
}
div{
border: 2px solid #D9E5FF;
}
</style>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-8">
				<div>
					<h2>예약 정보</h2>
					<p>예약자 이름은 체크인 시 제시할 신분증 이름과 동일하게 입력하세요.</p>
				</div>
				<div>
					<label id="col-8">예약자 이름</label>
					<p>
						<input type="text" placeholder="이름 입력">
				</div>
				<div>
					<label id="col-8">휴대폰 번호 </label>
					<p>
						<input type="text" placeholder="  -를 제외한 휴대폰 번호 입력">
				</div>
				<div style="margin-bottom:20px;">
					<label id="col-8">프로모션</label>
					<div class="row">
						<div class="col">할인코드</div>
						<div class="col" align="right">
							<a href="#collapseExample" data-toggle="collapse"
								aria-expanded="false" aria-controls="collapseExample"
								id=discountHide>선택/숨기기</a>
						</div>
					</div>
					<!-- 할인코드 -->
					<div class="collapse" id="collapseExample">
						<input type="text" placeholder="할인코드 12자리 입력">
					</div>
				</div>
				<!-- 이용약관 -->
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button"
									data-toggle="collapse" data-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">
									이용약관</button>
							</h2>
						</div>
						<div id="collapseOne" class="collapse show"
							aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">ㅂㅈㄷㅂㅈㄷ</div>
							<div class="checkbox" align="center">
								<input type="checkbox">약관에 동의합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									개인정보약관</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">ㅁㄴㅇㅁㄴㅇ</div>
							<div class="checkbox" align="center">
								<input type="checkbox">약관에 동의합니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									환불, 취소에 대한 약관</button>
							</h2>
						</div>
						<div id="collapseThree" class="collapse"
							aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body">ㅋㅌㅊㅋㅌㅊ</div>
							<div class="checkbox" align="center">
								<input type="checkbox">약관에 동의합니다.
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-4">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/a.jpg" height="150" width="100%">
				</div>
				
				<!-- 방정보 -->
				<div>
					<label id="col-4">호텔명</label>
					<p>주소부분</p>
					<p>주소부분</p>
				</div>
				
				<!-- 체크인, 체크아웃 정보 -->
				<div>
					<div class="row">
						<div class="col">체크인 날짜</div>
						<div class="col" align="right">~~~~</div>
					</div>
					<div class="row">
						<div class="col">체크아웃 날짜</div>
						<div class="col" align="right">~~~~</div>
					</div>
				</div>
				
				<!-- 객실정보 -->
				<div>
					<label id="col-4">객실명</label>
					<div class="row">
						<div class="col">객실 최대 인원(명)</div>
						<div class="col" align="right">3</div>
					</div>
					
					<div class="row">
						<div class="col">조식 가격</div>
						<div class="col" align="right"></div>
					</div>
					
					<div>부대시설</div>
					<div>부대시설 정보</div>
				</div>
				
				<!-- 가격정보 -->
				<div>
					<div class="row">
						<div class="col">예약가(won)</div>
						<div class="col" align="right">~~~~</div>
					</div>
					
					<div class="row">
						<div class="col">세금 및 서비스 요금</div>
						<div class="col" align="right">~~~~</div>
					</div>
					
				</div>
				
				<button type="button" class="btn btn-primary">예약</button>
				<button type="button" class="btn btn-danger">취소</button>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>