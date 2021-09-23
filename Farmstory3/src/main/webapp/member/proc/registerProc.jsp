<%@page import="kr.co.farmstory3.vo.MemberVo"%>
<%@page import="kr.co.farmstory3.dao.MemberDao"%>
<%@page import="kr.co.farmstory3.db.Sql"%>
<%@page import="kr.co.farmstory3.db.DBConfig"%>
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
	MemberVo vo = new MemberVo();
	vo.setUid(uid);
	vo.setPass(pass1);
	vo.setName(name);
	vo.setNick(nick);
	vo.setEmail(email);
	vo.setHp(hp);
	vo.setZip(zip);
	vo.setAddr1(addr1);
	vo.setAddr2(addr2);
	vo.setRegip(regip);
	
	MemberDao.getInstance().insertMember(vo);
	// 리다이렉트
	response.sendRedirect("/farmstory3/user/login.jsp");
%>