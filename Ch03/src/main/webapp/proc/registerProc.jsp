<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>registerProc</title>
	<!-- 
		날짜 : 2021/08/04
		이름 : 박승필
		내용 : JSP request 내장객체 실습하기
		
		request 내장객체
			- 클라이언트의 요청 정보를 갖는 객체
			- 클라이언트의 전송 데이터(Parameter)를 수신 기능을 제공
			
			Get 전송방식
			- 기본 데이터 전송방식
			- 서버에 페이지나 데이터를 요청하는 전송방식
			- 데이터 주소에 노출
			 
			Post 전송방식	
			- 서버에 데이터를 전달하면서 처리를 요청하는 전송방식
			- 전송 데이터를 요청메세지에 삽입해서 전송하므로 데이터 노출 안됨	
	 -->
</head>
<body>
	<h3>회원가입 데이터 수신하기</h3>
	<%
		request.setCharacterEncoding("UTF-8");
	
		// 데이터 수신
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobby");
		String addr = request.getParameter("addr");	
	%>

	<p>
		이름 : <%= name %><br/>
		성별 : <%= (gender.equals("1")) ? "남자" : "여자" %><br/>
		취미 : 
		<%
			for(String hobby : hobbies){
				out.print(hobby+", ");
			}
		
		%><br/>
		주소 : <%= addr %><br/>	
	</p>	
	
	<a href="/Ch03/3_1_Request.jsp">뒤로가기</a>

</body>
</html>