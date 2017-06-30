<%@page import="board.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Connection cn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	StringBuffer sql = new StringBuffer();
	sql.append(" select no, name, title, regdate, viewcount");
	sql.append(" from tb_board");
	sql.append(" order by no desc");
	
	List<BoardVO> list = new ArrayList<BoardVO>();
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		cn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe", "bigdata", "bigdata");
		ps = cn.prepareStatement(sql.toString());
		rs = ps.executeQuery();
		
		while(rs.next()) {
			BoardVO boardVO = new BoardVO();
			boardVO.setNo(rs.getLong("no"));
			boardVO.setName(rs.getString("name"));
			boardVO.setTitle(rs.getString("title"));
			boardVO.setRegdate(rs.getDate("regdate"));
			boardVO.setViewcount(rs.getInt("viewcount"));
			list.add(boardVO);
		
		}
		
		
		
	} catch(Exception e) {
		e.printStackTrace();
		
	} finally {
		if (rs != null) try{rs.close();} catch(Exception e) {}		
		if (ps != null) try{ps.close();} catch(Exception e) {}		
		if (cn != null) try{cn.close();} catch(Exception e) {}		
		
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/favicon.ico" />
</head>
<body>
<table>
	<caption>게시물 리스트</caption>
<tr>
	<th>번호</th>
	<th>작성자</th>
	<th>제목</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<% for(BoardVO boardVO :list) { %>

<tr>
	<th><%=boardVO.getNo() %></th>
	<th><%=boardVO.getName() %></th>
	<th><a href="content.jsp"><%=boardVO.getTitle() %></a></th>
	<th><%=boardVO.getRegdate() %></th>
	<th><%=boardVO.getViewcount() %></th>
</tr>
<% } %>
</table><br/>
<a href="insert.jsp">글쓰기</a><br/>
</body>
</html>