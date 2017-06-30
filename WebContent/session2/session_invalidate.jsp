<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //remove attribute를 함 (세션제거)
	response.sendRedirect("session_form.jsp");
	

%>
