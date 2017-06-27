<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function func_addmonth() {
	var f = document.myform;
	f.addmonth.value = 1;
	f.submit();
}
function func_submonth() {
	var f = document.myform;
	f.addmonth.value = -1;
	f.submit();
}
function func_addyear() {
	var f = document.myform;
	f.addyear.value = 1;
	f.submit();
}
function func_subyear() {
	var f = document.myform;
	f.addyear.value = -1;
	f.submit();
}

</script>
</head>
<body>
	<%-- 노출 안되는 스크립트릿 주석 --%>
	<!--  노출 되는 html 주석 -->


<form name="myform">
<input type="hidden" name="addmonth" value="0" />
<input type="hidden" name="addyear" value="0" />
	<%
	
	int year = 0;
	int month = 0;
	int addmonth = 0;
	int addyear = 0;

	
	Calendar c = Calendar.getInstance();
	
	
	try {	
		// 년, 월의 파라미터가 전달될 때
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		addmonth = Integer.parseInt(request.getParameter("addmonth"));
		addyear = Integer.parseInt(request.getParameter("addyear"));
		
		
		c.set(year + addyear, month - 1 + addmonth, 1);
		year = c.get(Calendar.YEAR);
		month = c.get(Calendar.MONTH) + 1;
		
	} catch(Exception e) {
		// 년, 월의 파라메터가 없을때 (가장 처음 수행했을 경우)
		year = c.get(Calendar.YEAR);
		month = c.get(Calendar.MONTH) + 1;
		c.set(year, month-1, 1);
			
	}
	
		int week = c.get(Calendar.DAY_OF_WEEK);
		int end_day = c.getActualMaximum(Calendar.DATE);
	%>


	<table style="width:250px;"> 
		<caption>
			
			<span onclick="func_subyear()" style="cursor:pointer;">◁</span>
			<span onclick="func_submonth()" style="cursor:pointer;">◀</span><select name="year" onchange="document.myform.submit()">
				<%
					for (int y = year - 5; y <= year + 5; y++) {
				%>
				<option <%=year == y ? " selected " : ""%>>
					<%=y%>
				</option>
				<%
					}
				%>

			</select>년 
			
			<select name="month" onchange="document.myform.submit()">
				<%
					for (int m = 1; m <= 12; m++) {
				%>
				<option <%=month == m ? "selected" : ""%>>
					<%=m%>
				</option>

				<%
					}
				%>

			</select>월<span onclick="func_addmonth()" style="cursor:pointer;">▶</span>
			<span onclick="func_addyear()" style="cursor:pointer;">▷</span>
		</caption>


		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>

		<tr>

			<%
				for (int d = 1; d < week; d++) {
					out.println("<td></td>");
				}

				for (int d = 1, w = week; d <= end_day; d++, w++) {
					out.println("<td>" + d + "</td>");
					if (w % 7 == 0)
						out.println("</tr><tr>");
				}
			%>
		</tr>

	</table>
</form>
</body>
</html>