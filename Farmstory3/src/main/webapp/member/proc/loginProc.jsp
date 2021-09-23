<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="kr.co.farmstory3.vo.MemberVo"%>
<%@page import="kr.co.farmstory3.dao.MemberDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	MemberVo vo = MemberDao.getInstance().selectMember(uid, pass);
	
	if(vo != null){
		// 회원이 맞을 경우
		session.setAttribute("sessMember", vo);
		response.sendRedirect("/farmstory3");
		
	}else{
		// 회원이 아닐 경우
		response.sendRedirect("/farmstory3/user/login.jsp?success=100");
	}

%>