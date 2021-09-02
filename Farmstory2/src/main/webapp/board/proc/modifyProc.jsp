<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group   = request.getParameter("group");
	String cate    = request.getParameter("cate");
	String seq     = request.getParameter("seq");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	
	ArticleDao.getInstance().updateArticle(title, content, seq);
	
	response.sendRedirect("/Farmstory2/board/view.jsp?group="+ group + "&cate=" + cate+"&seq="+seq);
%>