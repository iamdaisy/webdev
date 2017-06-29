<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../favicon.ico" />
</head>
<body>
	<%
		String[] names = request.getParameterValues("name");
		for (String name : names) {
			Cookie cookies = new Cookie(name, "");
			cookies.setMaxAge(0);
			response.addCookie(cookies);
		}
		response.sendRedirect("cookie_status.jsp");
	%>

</body>
</html>