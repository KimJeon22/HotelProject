<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guest_reply.jsp]</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<script type="text/javascript">


	function re_save(){
		var id = "<%=session.getAttribute("m_id")%>";
		if(id==null){
			alert("로그인 후 이용해주세요");
		} else if(id!=null) {
			if(!$(':input:radio[name=re_rate]:checked').val()) {   
			   alert("별점 체크!");
			   return;
			}
			else
				document.myform.submit();
		}
		
		
	}
</script>

</head>
<body>
	<div>
		<form method="post" name="myform" action="rinsert.do">
			<textarea class="form-control" name="re_content" rows="3"></textarea>
			<label class="radio-inline">
			  <input type="radio" name="re_rate" id="inlineRadio1" value="1"> <font color="orange">★</font>
			</label>
			<label class="radio-inline">
			  <input type="radio" name="re_rate" id="inlineRadio2" value="2"> <font color="orange">★★</font>
			</label>
			<label class="radio-inline">
			  <input type="radio" name="re_rate" id="inlineRadio3" value="3"> <font color="orange">★★★</font>
			</label>
			<label class="radio-inline">
			  <input type="radio" name="re_rate" id="inlineRadio3" value="4"> <font color="orange">★★★★</font>
			</label>
			<label class="radio-inline">
			  <input type="radio" name="re_rate" id="inlineRadio3" value="5"> <font color="orange">★★★★★</font>
			</label>
			<input type="hidden" name="url" value="${url}"/>
			<input type="button" id=roomAppend class="btn btn-primary" onClick="re_save()" value="댓글 저장"/>
		</form>
	</div>
	<div>
		<table class="table">
			<tr>
				<th>작성자</th>
				<th>내용</th>
				<th>작성날짜</th>
			</tr>
			<c:forEach var="dto" items="${redto}">
				<tr>
					<td>${dto.m_id}</td>
					<td>${dto.re_content}
					<c:if test="${dto.m_id==sessionScope.m_id}">
						<a href="replydelete.do?Gidx=${dto.re_id}" class="btn btn-danger">삭제</a>
					</c:if>
					</td>
					<td>${dto.date }</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>