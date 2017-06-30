<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String user_id = request.getParameter("user_id").trim();
	String user_name = request.getParameter("user_name").trim();
	
	if (user_id.equals("") || user_name.equals("")) {
			request.setAttribute("msg", "아이디와 이름을 넣으세요!!!!");
			request.setAttribute("url", "/session2/session_form.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
			dispatcher.forward(request, response);
			return;
	} 
	session.setAttribute("user_id", user_id);
	session.setAttribute("user_name", user_name);
	session.setAttribute("user_level", request.getParameter("user_level"));
	response.sendRedirect("main.jsp");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href = "../favicon.ico" />
</head>
<body>

</body>
</html>