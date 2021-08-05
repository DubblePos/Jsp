<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sessionConfirm</title>
</head>
<body>
	<h3>현재 클라이언트 세션확인</h3>
	<%
		String sid = session.getId();//번호표
		String uid = (String) session.getAttribute("uid");//타입이안맞아 케스팅.
		String pass= (String) session.getAttribute("pass");
	
	
	%>

	<p>
		클라이언트 세션아이디 : <%=sid %><br/>
		클라이언트 아이디 : <%=uid %><br/>
		클라이언트 비밀번호 : <%=pass %><br/>
	</p>
	<a href="../3_4_Session.jsp">로그인하러 가기</a>
</body>
</html>