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
	
		<!-- 상세검색 css -->
	 <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
	<div class="container">
		<div class="row">

			<!-- 왼쪽 화면 -->
			<div class="col-sm-4">
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">1박당 가격</button>
							</h2>
						</div>
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body"> ㅁㄴㅇ</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">호텔 검색</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body"> zxczxczxc</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">평점</button>
							</h2>
						</div>
						<div id="collapseThree" class="collapse show" aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body"> ㅁㄴㅇ</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header" id="headingFour">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">장소</button>
							</h2>
						</div>
						<div id="collapseFour" class="collapse show" aria-labelledby="headingFour" data-parent="#accordionExample">
							<div class="card-body"> ㅁㄴㅇ</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-header" id="headingFive">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">주변 시설</button>
							</h2>
						</div>
						<div id="collapseFive" class="collapse show" aria-labelledby="headingFive" data-parent="#accordionExample">
							<div class="card-body"> ㅁㄴㅇ</div>
						</div>
					</div>					
					
					
				</div>
			</div>

			<!--  오른쪽 화면  -->


		</div>
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
	<script src="assets/js/util.js"></script> <!-- util functions included in the CodyHouse framework -->
	<script src="assets/js/main.js"></script>
	
</body>
	<script type="text/javascript">
		$('.collapse').collapse('hide');
	</script>
</body>
</html>