<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cate   = request.getParameter("cate");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String uid 	   = request.getParameter("uid");
	String regip   = request.getRemoteAddr();
	
	
	ArticleBean article = new ArticleBean();
	article.setCate(cate);
	article.setTitle(title);
	article.setContent(content);
	article.setFile(0);
	article.setUid(uid);
	article.setRegip(regip);
	
	ArticleDao.getInstance().insertArticle(article);
	
	response.sendRedirect("/Farmstory1/croptalk/grow.jsp");
%>