<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function plus(){
	  var value= parseInt(document.getElementById('number').value);
	  value = isNaN(value) ? 0 : value;
	  value++;
	  document.getElementById('number').value = value;
	   
   }
   
   function minus(){
	   var value= parseInt(document.getElementById('number').value);
	   value= isNaN(value) ? 0 : value;
	   if(value>0){
		   value--;
		  document.getElementById('number').value = value;
	   }
   }		
</script>
</head>
<body>


    <div>
        <label for="name">인원수</label><br>
        <input type="button"  onclick="minus()" value="-">               
        <input type="text" id="number" value="0">
        <input type="button"  onclick="plus()" value="+">
    </div>
    
   

</body>
</html>