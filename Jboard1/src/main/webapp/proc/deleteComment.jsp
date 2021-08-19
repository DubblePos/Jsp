<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String parent = request.getParameter("parent");
	String seq = request.getParameter("seq");	

	// 댓글 삭제
	ArticleDao.getInstance().deleteComment(seq);
	
	// 댓글 카운트 -1
	ArticleDao.getInstance().updateCommentCount(parent, -1);
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?seq=" +parent);
%>