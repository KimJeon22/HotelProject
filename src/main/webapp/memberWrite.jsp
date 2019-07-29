<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[회원가입 페이지]</title>

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
#input {width:70%;}
</style>

</head>
<body>
	<form method="get" action="minsert.do">
		<div class="container">
			<div>
				ID <input id="input" name="m_id" type="text" placeholder="ID 입력">
			</div>
			<div>
				password <input id="input" name="m_pwd" type="password" placeholder="비밀번호 입력">
			</div>
			<div>
				이름 <input id="input" name="m_name" type="text" placeholder="이름 입력">
			</div>
			<div>
				H.P <input id="input" name="m_phone" type="text" placeholder=" -를 제외한 휴대폰번호 입력">
			</div>
			<input type="submit" class="btn btn-primary" value="등록"/>
		</div>
		
	</form>


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