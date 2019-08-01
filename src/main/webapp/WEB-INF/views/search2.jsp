<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
#date {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

#country{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}


#submit {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

#submit:hover {
  background-color: #45a049;
}

.search {
  float:left;
  margin-right:10px;
  width: 90%;
  border-radius: 5px;
  background-color: #29416B;
  padding: 20px;
}

label{
  color: white;
  font-size: large;
}

input{
  font-size: small;

}

</style>

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
<body>

<div class="search" >
  <form action="search.do">
<!--     <label for="country">지 역</label>
    <select id="country" name="country">
      <option value="australia">Australia</option>
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
      <option value="usa">Africa</option>
      <option value="usa">Canada</option>
    </select>
     -->
  
    <label for="checkin">체크인</label>
    <input id="date" type="date" >

    <label for="checkout">체크아웃</label>
     <input id="date" type="date" >
     
     <div >
        <label for="name">인원수</label><br>
        <input type="button"  onclick="minus()" value="-">               
        <input type="text" id="number" style="text-align:center;" value="0">
        <input type="button"  onclick="plus()" value="+">
    </div>
    <br>
    
    <input type="submit"  id="submit" value="검 색">  
  </form>
</div>
 
</body>
</html>