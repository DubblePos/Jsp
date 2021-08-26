<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String uid = request.getParameter("uid");
	String uri = request.getRequestURI();

	int start = uri.lastIndexOf("/") + 1; // '/'다음으로 하는것. 즉 /없애기
	int end	  = uri.lastIndexOf(".");
	
	String cate = uri.substring(start, end);
%>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory1/board/proc/writeProc.jsp" method="post">
        	<input type="hidden" name="cate" value="<%= cate %>" />
        	<input type="hidden" name="uid" value="<%= uid %>" />
        	<input type="hidden" name="uri" value="<%= uri %>" />
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="fname"/></td>
                </tr>
            </table>
            <div>
                <a href="<%= uri %>" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>