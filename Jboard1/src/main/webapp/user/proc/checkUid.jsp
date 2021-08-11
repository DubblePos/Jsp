<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	// DB정보
	String host = "jdbc:mysql://54.180.160.240:3306/wks194510";
	String user = "wks194510";
	String pass = "1234";
	
	int result = 0;
	
	try{
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
		String sql = "SELECT COUNT(`uid`) FROM `Jboard_member` WHERE `uid`=?;";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
		// 5단계
		
		
		if(rs.next()){
			result = rs.getInt(1);
		}
		// 6단계
		rs.close();
		conn.close();
		psmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// Json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json);
	


%>