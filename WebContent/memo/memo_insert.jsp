<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href = "../favicon.ico" />
</head>
<body>
<form action="memo_insert_action.jsp" method="post">
<table>
	<caption> 메모입력 </caption>
<tr>
	<th>작성자</th>
	<td><input type="text" name="name"/></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="title"/></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea cols="40" rows="5" name="content"/></textarea></td>
</tr>
<input type="submit" value="완료" />
</table>
</form>

</body>
</html>