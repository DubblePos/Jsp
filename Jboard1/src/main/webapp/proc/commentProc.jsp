<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	
	request.setCharacterEncoding("UTF-8");
	String parent =  request.getParameter("parent");
	String content =  request.getParameter("content");
	String uid =  request.getParameter("uid");
	String regip =  request.getRemoteAddr();

	
	
	ArticleBean ab = new ArticleBean();
	ab.setParent(parent);
	ab.setContent(content);
	ab.setUid(uid);
	ab.setRegip(regip);

	// 댓글 등록하기
	 ArticleDao.getInstance().insertComment(ab);
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);


%>