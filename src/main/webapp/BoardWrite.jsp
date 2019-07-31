<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[게시글 쓰기]</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style type="text/css">
label, #col-8 {
	font-size: 25px;
}

div {
	border: 2px solid #D9E5FF;
}

#input {
	width: 70%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	var a = 1;
	$(document).ready(function() {
		$("#roomAppend").click(function() {
			a++;
			if(a<5){
				$(".asd").append(
					"<br>"
					+ "객실 "+a+":"
					+ "<div class='form-group'>"
					+ "<input type='text' name='bo_title' class='form-control' placeholder='객실 이름 입력'>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<input type='text' name='bo_title' class='form-control' placeholder='객실 가격 입력'>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<input type='text' name='bo_title' class='form-control' placeholder='객실 서비스 입력'>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<input type='text' name='bo_title' class='form-control' placeholder='객실 최대 인원 입력'>"
					+ "</div>");
			} else {window.alert("객실은 최대 4개만 가능");}
		});
	});
</script>

</head>
<body>
	<div class="container">
		<form method="post" enctype="multipart/form-data" action="boardInsert.do">
			<div class="form-group">
				<input type="file" class="btn btn-outline-primary" name="files"
					multiple>
			</div>
			<div class="form-group">
				<input type="text" name="h_name" class="form-control"
					placeholder="호텔 이름 입력">
			</div>
			<div class="form-group">
				<input type="text" name="h_adress" class="form-control"
					placeholder="호텔 주소 입력">
			</div>
			<div class="form-group">
				<input type="text" name="h_content" class="form-control"
					placeholder="호텔 설명 입력">
			</div>
			객실 1:
			<div class="form-group">
				<input type="text" name="r_name1" class="form-control"
					placeholder="객실 이름 입력">
			</div>
			<div class="form-group">
				<input type="text" name="r_price1" class="form-control"
					placeholder="객실 가격 입력">
			</div>
			<div class="form-group">
				<input type="text" name="r_service1" class="form-control"
					placeholder="객실 서비스 입력">
			</div>
			<div class="form-group asd">
				<input type="text" name="r_inwon1" class="form-control"
					placeholder="객실 최대 인원 입력">
			</div>

			<input type="submit" class="btn btn-primary" value="글 저장">
		</form>
		<button id=roomAppend>객실 추가</button>
	</div>
	
</body>
</html>