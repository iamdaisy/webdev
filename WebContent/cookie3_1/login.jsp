<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie[] cookies = request.getCookies();
	String save_id = "";
	if (cookies != null) {
		for (int i=0; i < cookies.length; i++) {
			if(cookies[i].getName().trim().equals("save_id")) {
				System.out.println(cookies[i].getValue());
				save_id = cookies[i].getValue();
			}
		}
		
	}


%> 
   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href = "../favicon.ico" />
</head>
<body>
<form action="login_action.jsp" method ="post">
<table>
	<caption>로그인</caption>
<tr>
	<th>아이디</th>
	<td><input type="text" name="user_id" value="<%=save_id %>" /></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="user_pw" /></td>
</tr>
<tr>
	<td></td>
	<td>
		<input type="checkbox" name="save_id" <% if(save_id.length() > 1) out.println("checked"); %>/> 아이디 저장
	</td>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="완료" />
	</td>
</tr>

</table>
</form>
</body>
</html>