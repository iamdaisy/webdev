<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 div.imm {position:absolute;left:670px;top:100px;z-index:4;width:90px}

</style>
<link rel="shortcut icon" href="/favicon.png" />
</head>
<body>
<img src="img/whoami2.png" />

<div class="imm"><h2>
<%=request.getAttribute("iam") %>
</h2></div>
<%--
	String iam = (String)request.getAttribute("iam");
	out.println(iam);
--%>

${iam}!  <%-- request 개체에 있는것은 바로 꺼내옴 --%>

</body>
</html>