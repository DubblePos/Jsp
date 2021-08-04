<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_3_Loop</title>
		<%--
		날짜 : 2021/08/04
		이름 : 박승필
		내용 : JSP 반복문 실습하기
	 --%>
</head>
<body>
	<h3>3.JSP 반복문 실습하기</h3>
	
	<h4>for</h4>
	<%
		for(int i=1; i<=5; i++){
			out.print("<p>i : "+i+"</p>");
		}
	
	%>
	
	<h4>while</h4>
	<%
		int k = 1;
		while(k <= 5){
	%>
		<p>k : <%= k %></p>
	<%
			k++;
		}
	%>
		
	<h4>구구단표</h4>
	<table border="1">
	<tr>
		<td>2단</td>
		<td>3단</td>
		<td>4단</td>
		<td>5단</td>
		<td>6단</td>
		<td>7단</td>
		<td>8단</td>
		<td>9단</td>
	</tr>
	<%for(int x=1; x<10; x++){ %>
		<tr>
			<% for(int y=2; y<=9; y++){ %>
			 <td><%=y %> x <%=x %> =<%=y*x%></td>
			<%} %>			
		 </tr>
		<% } %>
	</table>
</body>
</html>