<%@page import="memo.model.MemoV0"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	MemoV0 memoV0 = new MemoV0();
	memoV0.setName(name);
	memoV0.setTitle(title);
	memoV0.setContent(content);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href = "../favicon.ico" />
</head>
<body>
<%=memoV0 %>
</body>
</html>