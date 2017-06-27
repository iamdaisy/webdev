<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href = "../favicon.ico" />


<script type="text/javascript">
 function input_check() {
	 console.log('input_check 수행중');
	 var f = document.myform;
	 console.log('userid : ' + f.userid.value);
	 console.log('userpw : ' + f.userpwd.value);
	 console.log('--------------------------');
	 console.log('userid : ' + document.getElementById('userid').value);
	 console.log('userpw : ' + document.getElementById('userpwd').value);
	 
	 var user_id = document.getElementById('userid').value;
	 var user_pw = document.getElementById('userpwd').value;
 
 	 if (user_id === '') {              // === 타입까지 일치해야함
 		 alert('아이디를 입력하세요');
 		 return;
 	 }
 	 
 	 if (user_pw === '') {    
 		 alert('비밀번호를 입력하세요');
 		 return;
 	 }
 	 f.submit();
 }
</script>

</head>
<body>
<form name="myform" method="post" action="testLogin.jsp">
	<label for="userid"> 아이디 : </label>
	<input type="text" name="id" id="userid" autofocus="autofocus"><br>
	
	<label for="userpw"> 암 &nbsp; 호 : </label>
	<input type="password" name="pwd" id="userpwd"><br>
	<input type="button" value="로그인" onclick="input_check()" />
</form>
</body>
</html>