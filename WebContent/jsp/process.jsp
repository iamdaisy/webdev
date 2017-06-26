<%@ page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
 <% // 자바코드 기술
 	String name = request.getParameter("name");
 	int age = Integer.parseInt(request.getParameter("age"));
 /* 
 	String v_age =request.getParameter("v_age");
 	age = age/10;
 	
 	if (age > 7) {
 		v_age = "종심";
 	} else if (age == 6) {
 		v_age = "이순";
 	} else if (age == 5) {
		v_age = "지천명";
	
 	} else if (age == 4) {
		v_age = "불혹";
	
 	} else if (age == 3) {
		v_age = "이립";
	
 	} else if (age == 2) {
		v_age = "약관";

 	} else{
		v_age = "묘령";
 	}
 	
 	age = Integer.parseInt(request.getParameter("age")); */
  %> 
  
 <%! //변수와 메소드를 선언하는 용도
	public String commentAge(int age) {
		switch(age/10) {
		case 0:
		case 1:return "묘령";
		case 2:return "약관";
		case 3:return "이립";
		case 4:return "불혹";
		case 5:return "지천명";
		case 6:return "이순";
		default:return "종심";
		}
	}
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 그래, 난 <%=name %>. 포기를 모르는 남자지.
<h2> 나이: <%=age %> (<%=commentAge(age)%>)</h2>
</body>
</html>