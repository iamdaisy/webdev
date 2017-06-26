<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

	int cnt = 0;
	String bad_user_ip = "72.12.50.69";
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  실습: 
옆사람이 접근시 declaration에 접속카운트를 저장하는 변수를 누적
짝수번째 접근시 차단 메시지

홀수번째 접근시 "당신의 아이피는 x,x,x,x입니다."
짝수번째 접근시는 "당신은 불량유저이므로 접속을 차단합니다" -->

<% 
	
	// String ip = request.getRemoteAddr();
	
	
	if (request.getRemoteAddr().equals(bad_user_ip)) {
		++cnt;
		out.print("<h3><center>" + ++cnt + "<br/>");
		
		
		if (cnt % 2 == 0) {
			out.print("당신은 불량유저이므로 접속을 차단합니다.");
		} else {
			out.print("당신의 아이피는" + bad_user_ip + "입니다");
		}
	}

%>
</body>
</html>