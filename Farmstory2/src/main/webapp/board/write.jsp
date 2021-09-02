<%@ page import="kr.co.farmstory2.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String includeFile = "./_aside"+group+".jsp";

%>

<%@ include file="../_header.jsp" %>
<jsp:include page="<%= includeFile %>" >
	<jsp:param name="cate" value="<%= cate %>"/>
</jsp:include>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory2/board/proc/writeProc.jsp?group=<%=group %>&cate=<%= cate %>" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="uid" value="<%= mb.getUid()%>"/>
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
                <a href="#" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>
 <!--내용 끝-->
                  
            </article>
        </section>
    </div>
<%@ include file="../_footer.jsp" %>