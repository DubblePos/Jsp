<%@page import="kr.co.farmstory2.dao.MemberDao"%>
<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String nick = request.getParameter("nick");
	
	// 1:uid 체크, 2:nick 체크, 3:email 체크, 4:hp 체크 
	int result = MemberDao.getInstance().selectCountUserInfo(2, nick);
	// Json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);
%>




