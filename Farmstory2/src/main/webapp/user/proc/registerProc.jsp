<%@page import="kr.co.farmstory2.bean.MemberBean"%>
<%@page import="kr.co.farmstory2.dao.MemberDao"%>
<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	MemberBean mb = new MemberBean();
	mb.setUid(uid);
	mb.setPass(pass1);
	mb.setName(name);
	mb.setNick(nick);
	mb.setEmail(email);
	mb.setHp(hp);
	mb.setZip(zip);
	mb.setAddr1(addr1);
	mb.setAddr2(addr2);
	mb.setRegip(regip);
	
	MemberDao.getInstance().insertMember(mb);
	// 리다이렉트
	response.sendRedirect("/Farmstory2/user/login.jsp");
%>