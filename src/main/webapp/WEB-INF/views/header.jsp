<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.dropdown{
	margin-left: 1300px;
	z-index: 3;
}
.bg-color{
 background: rgb(76, 80, 87);
 color:white;
}

.cd-accordion__item{
}
a:link { color: white; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: white; text-decoration: underline;}

</style>
</head>
<body>
	
	
	<!-- nav 화면 -->
	<nav class="navbar navbar-expand-lg bg-color">
		<a class="navbar-brand" href="mainpage.do">호텔프로젝트</a>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<c:if test='${sessionScope.m_id eq null}'>
					<a class="nav-item nav-link active" href="mainpage.do">Home </a>
					<a class="nav-item nav-link login" data-toggle="modal" data-target=".bd-example-modal-sm"  href="#">로그인</a> 
					<a class="nav-item nav-link" data-toggle="modal" data-target=".bd-example-modal-lg" href="#">회원가입</a>
				</c:if>
				<c:if test='${sessionScope.m_id ne null}'>
					<a class="nav-item nav-link active" href="mainpage.do">Home </a>
					<a class="nav-item nav-link login" data-toggle="modal" data-target="#exampleModalCenter" href="#">호텔추가</a>
 					<li class="nav-item dropdown form-inline my-2 my-lg-0">
       					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.m_id }님 </a>
       						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          						<a class="dropdown-item" href="#">예약확인</a>
          						<a class="dropdown-item" href="#">마이페이지</a>
          						<div class="dropdown-divider"></div>
          						<a class="dropdown-item"  href="logout.do">로그아웃</a>
        					</div>
     				 </li>
				</c:if>
			</div>
		</div>
	</nav>

	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form method="get" action="minsert.do">
					<div class="container">
						<h5>회원가입</h5>
						<br>
						<div>
							ID <input id="input" name="m_id" type="text" placeholder="ID 입력">
						</div>
						<div>
							password <input id="input" name="m_pwd" type="password"
								placeholder="비밀번호 입력">
						</div>
						<div>
							이름 <input id="input" name="m_name" type="text"
								placeholder="이름 입력">
						</div>
						<div>
							H.P <input id="input" name="m_phone" type="text"
								placeholder=" -를 제외한 휴대폰번호 입력">
						</div>
						<input type="submit" class="btn btn-primary" value="등록" />
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="container">
					<form method="post" action="loginCheck.do">
						<div>
							ID <input id="input" name="m_id" type="text" placeholder="ID 입력">
						</div>
						<div>
							password <input id="input" name="m_pwd" type="password"
								placeholder="비밀번호 입력">
						</div>
						<input type="submit" class="btn btn-primary" value="등록" />
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered" role="document">
    		<div class="modal-content">
				<div class="container">
					<form method="post" enctype="multipart/form-data" action="boardInsert.do">
						<div class="form-group">
							<input type="file" class="btn btn-outline-primary" name="files" multiple>
						</div>
						<div class="form-group">
							<input type="text" name="h_name" class="form-control" placeholder="호텔 이름 입력">
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
				<input type="text" name="rl_name[0]" class="form-control"
					placeholder="객실 이름 입력">
			</div>
			<div class="form-group">
				<input type="text" name="rl_price[0]" class="form-control"
					placeholder="객실 가격 입력">
			</div>
			<div class="form-group">
				<input type="text" name="rl_service[0]" class="form-control"
					placeholder="객실 서비스 입력">
			</div>
			<div class="form-group asd">
				<input type="text" name="rl_inwon[0]" class="form-control"
					placeholder="객실 최대 인원 입력">
			</div>

			<input type="submit" class="btn btn-primary" value="글 저장">
		</form>
		<button id=roomAppend>객실 추가</button>
	</div>
	</div></div></div>
	
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	var a = 2;
	$(document).ready(function() {
		$("#roomAppend").click(function() {
			if(a<5){
				$(".asd").append(
					"<br>"
					+ "객실 "+a+":"
					+ "<div class='form-group'>"
					+ "<input type='text' name='rl_name["+(a-1)+"]' class='form-control' placeholder='객실 이름 입력'>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<input type='text' name='rl_price["+(a-1)+"]' class='form-control' placeholder='객실 가격 입력'>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<input type='text' name='rl_service["+(a-1)+"]' class='form-control' placeholder='객실 서비스 입력'>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<input type='text' name='rl_inwon["+(a-1)+"]' class='form-control' placeholder='객실 최대 인원 입력'>"
					+ "</div>");
			} else {window.alert("객실은 최대 4개만 가능");}
			a++;
		});
	});
</script>
</body>
</html>