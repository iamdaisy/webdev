<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	String name=request.getParameter("want");

%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(want.css);
</style>
</head>
<body>
<div id="want"><img src="want.png" width="60%" /></div>
<div class="say">


<h3> <%=name %>가 하고싶어요.</h3>


</div>
</body>
</html>