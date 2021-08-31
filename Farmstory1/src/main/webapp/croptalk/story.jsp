<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<div id="sub" class="cate3">
    <div><img src="../img/sub_top_tit3.png" alt="CROP TALK"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
            <ul>
                <li class="on"><a href="./story.jsp">농작물이야기</a></li>
                <li><a href="./grow.jsp">텃밭가꾸기</a></li>
                <li><a href="./school.jsp">귀농학교</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 ><strong>농작물이야기</strong>
                </p>
            </nav>

            <!-- 내용 시작-->
         	<% if(mode.equals("l")){ %>
            	<jsp:include page="../board/list.jsp"/>
            <% }else if(mode.equals("w")){ %>
            	<jsp:include page="../board/write.jsp">
            		<jsp:param name="uid" value="<%= mb.getUid() %>"/>
            	</jsp:include>
            <% }else if(mode.equals("v")){ %>
            	<jsp:include page="../board/view.jsp">
            		<jsp:param name="uid" value="<%= mb.getUid() %>"/>
            	</jsp:include>
            <% }else if(mode.equals("m")){ %>
            	<jsp:include page="../board/modify.jsp">
            		<jsp:param name="uid" value="<%= mb.getUid() %>"/>
            	</jsp:include>
            <% } %>
            <!-- 내용 끝-->
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>