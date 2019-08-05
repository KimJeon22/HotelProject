<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript">
	$(function() {
   	 	getTimeStamp();
	});

	function getTimeStamp() {
		  var now = new Date();
	      var year= now.getFullYear();
	      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	      var day = now.getDate()>9 ? ''+now.getDate() : '0'+(now.getDate());
	      var tommorow = now.getDate()>9 ? ''+now.getDate() : '0'+(now.getDate()+1);
	      var chan_val1 = year + '-' + mon + '-' + day;
	      var chan_val2 = year + '-' + mon + '-' + tommorow;
	      
	      $('.date1').val(chan_val1);
	      $('.date2').val(chan_val2);
	}

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

<!-- serach css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sora.css">

<body>

<div class="search" >
  <form method="get" action="list.do">
<!--     <label for="country">지 역</label>
    <select id="country" name="country">
      <option value="australia">Australia</option>
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
      <option value="usa">Africa</option>
      <option value="usa">Canada</option>
    </select>
     -->
    <div>
    <label for="country">지 역 </label><br>
    <input id="country" type="text" name="h_adress">
   
    </div>
  
    <label for="checkin">체크인</label>
    <input id="date" class="date1" type="date" name="CheckIn_date">

    <label for="checkout">체크아웃</label>
     <input id="date" class="date2" type="date" name="CheckOut_date">
     
     <div >
        <label for="name">인원수</label><br>
        <input type="button"  onclick="minus()" value="-">               
        <input type="text" id="number" style="text-align:center;" value="0" name="inwon">
        <input type="button"  onclick="plus()" value="+">
    </div>
    <br>
    
    <input type="submit"  id="submit" value="검 색">  
  </form>
</div>
 
 

</body>
</html>