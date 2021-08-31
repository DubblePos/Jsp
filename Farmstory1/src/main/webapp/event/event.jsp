<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

<div id="sub" class="cate4">
    <div><img src="../img/sub_top_tit4.png" alt="CROP TALK"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate4_tit.png" alt="이벤트"/>
            <ul>
                <li class="on"><a href="./event.jsp">이벤트</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate4_tit1.png" alt="이벤트"/>
                <p>
                    HOME > 이벤트 ><strong>이벤트</strong>
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