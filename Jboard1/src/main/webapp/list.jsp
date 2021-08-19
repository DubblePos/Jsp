<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	if(mb == null){
		// 로그인을 하지 않고 list 페이지를 요청했을 때
		response.sendRedirect("/Jboard1/user/login.jsp?success=102");
		return;
	}
	
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	
	if(pg == null){
		pg = "1";
	}
	
	// 페이지 처리
	int start = 0;
	int currentPage = Integer.parseInt(pg);
	int total = ArticleDao.getInstance().selectCountTotal();
	int lastPageNum = 0;
	
	if(total % 10 == 0){
		lastPageNum = total / 10;
	}else{
		lastPageNum = total / 10 + 1;
	}	
	start = (currentPage - 1) * 10;
	
	int pageStartNum = total - start;
	int groupCurrent = (int)Math.ceil(currentPage / 10.0);
	int groupStart = (groupCurrent - 1) * 10 + 1;
	int groupEnd = groupCurrent * 10;
	
	if(groupEnd > lastPageNum){
		groupEnd = lastPageNum;
	}
	
	// 게시물 가져오기
	List<ArticleBean> articles = ArticleDao.getInstance().selectArticles(start);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    <%= mb.getNick() %>님 반갑습니다.
                    <a href="/Jboard1/user/proc/logoutProc.jsp" class="logout">[로그아웃]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <% for(ArticleBean article : articles){ %>
                    <tr>
                        <td><%= pageStartNum-- %></td>
                        <td><a href="/Jboard1/view.jsp?seq=<%= article.getSeq() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                        <td><%= article.getNick() %></td>
                        <td><%= article.getRdate().substring(2, 10) %></td>
                        <td><%= article.getHit() %></td>
                    </tr>
                    <% } %>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
                
                <% if(groupStart > 1){ %>
                	<a href="/Jboard1/list.jsp?pg=<%= groupStart - 1 %>" class="prev">이전</a>
                <% } %>
                
                <% for(int i=groupStart ; i<=groupEnd ; i++){ %>
                	<a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%= (currentPage == i) ? "current":"" %>"><%= i %></a>
                <% } %>
                
                <% if(groupEnd < lastPageNum){ %>
                	<a href="/Jboard1/list.jsp?pg=<%= groupEnd + 1 %>" class="next">다음</a>
                <% } %>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Jboard1/write.jsp?pg=<%= pg %>" class="btnWrite">글쓰기</a>

        </section>
    </div>    
</body>
</html>