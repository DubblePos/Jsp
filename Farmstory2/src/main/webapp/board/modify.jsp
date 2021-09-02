<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@page import="kr.co.farmstory2.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String includeFile = "./_aside" +group+ ".jsp"; 
	// 수정 글 가져오기
	ArticleBean article = ArticleDao.getInstance().selectArticle(seq);
%>
<jsp:include page="<%= includeFile %>">
	<jsp:param name="cate" value="<%= cate %>"/>
</jsp:include>
<section id="board" class="modify">
     <h3>글수정</h3>
     <article>
         <form action="/Farmstory2/board/proc/modifyProc.jsp?group=<%= group %>&cate=<%= cate %>&seq=<%= article.getSeq() %>" method="post">
         <input type="hidden" name="seq" value="<%= seq %>"/>
             <table>
                 <tr>
                     <td>제목</td>
                     <td><input type="text" name="title"  value="<%= article.getTitle() %>" placeholder="제목을 입력하세요."/></td>
                 </tr>
                 <tr>
                     <td>내용</td>
                     <td>
                         <textarea name="content"><%= article.getContent() %></textarea>                                
                     </td>
                 </tr>
                 <!-- 
                 <tr>
                     <td>첨부</td>
                     <td><input type="file" name="file"/></td>
                 </tr>
                  -->
             </table>
             <div>
                 <a href="/Farmstory2/board/view.jsp?group=<%= group %>&cate=<%= cate %>&seq=<%= article.getSeq() %>" class="btnCancel">취소</a>
                 <input type="submit"  class="btnWrite" value="수정완료"/>
            </div>
        </form>
    </article>
</section>
<%@ include file="../_footer.jsp" %>