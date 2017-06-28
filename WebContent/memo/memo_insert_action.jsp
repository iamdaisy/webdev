<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="memo.model.MemoV0"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memoV0" class="memo.model.MemoV0" />
<jsp:setProperty name="memoV0" property="*" />

<%
	Connection cn = null;
	PreparedStatement ps = null;     // insert update delete는 두개만 필요(select는 resultset까지)
	
	StringBuffer sql = new StringBuffer();
	sql.append(" insert into t_memo(no, name, title, content)");
	sql.append(" values(seq_memo.nextval, ?, ?, ?)");
	boolean result = false;
	
	try {
		//드라이버가 있는지 없는지 먼저 확인
		Class.forName("oracle.jdbc.OracleDriver");
		cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bigdata","bigdata");
		//out.println("연결성공");
		ps = cn.prepareStatement(sql.toString());
		ps.setString(1, memoV0.getName());
		ps.setString(2, memoV0.getTitle());
		ps.setString(3, memoV0.getContent());
		ps.executeUpdate(); // select문은 executeQuery()사용.
		result = true;
		
	} catch(Exception e){
		//out.println("연결실패: " + e.getMessage());
		e.printStackTrace();
		
	} finally { //자원 역순으로 반납
		if(ps != null) try{ps.close();} catch(Exception e) {}
		if(cn != null) try{cn.close();} catch(Exception e) {}
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
<% if(result){ %>
메모 등록 성공
<% } else { %>
메모 등록 실패
<% } %>
</body>
</html>