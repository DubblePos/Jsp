<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	if(mb == null){
		// 로그인을 하지 않고 view 페이지를 요청했을 때
		response.sendRedirect("/Jboard1/user/login.jsp?success=103");
		return;
	}

	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	
	ArticleDao dao = ArticleDao.getInstance();
	
	// 조회수 업데이트
	dao.updateArticleHit(seq);
	// 글 가져오기
	ArticleBean article = dao.selectArticle(seq);
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(seq);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	$(document).ready(function() {
    		
    		// 댓글 삭제
    		$('.btnCommentDel').click(function(){ 			
    			var result = confirm('정말 삭제 하시겠습니까?');
    			return result;
    		});
    		
    		var content = '';
    		
    		// 댓글 수정
    		$('.btnCommentModify').click(function(){
    			
    			var mode = $(this).text(); //태그의 내용(삭제)을 구하는
    			   			
    			var textarea = $(this).parent().prev()
    			
    			if(mode == '수정'){
    				// 수정모드   				
    				content = textarea.val();
    				
    				$(this).prev().css('display', 'none'); //출력화면에서 제외하기
    				$(this).next().css('display', 'inline'); //a태그의 원래속성은 inline
    				$(this).text('수정완료');
    				textarea.attr('readonly', false).focus();
        			textarea.css({
        				'background':'white',
        				'outline' : '1px solid gray'
        			});
    			}else{
    				// 수정완료 모드
    				
    				var seq = textarea.attr('data-seq');
    				var comment = textarea.val();
    				
    				//{}객체표기
    				var jsonData = {
    						'seq': seq,
    						'comment': comment
    					}; 
    				
    				// 서버에 수정 요청 전송
    				$.ajax({
    					url: '/Jboard1/proc/updateComment.jsp', //get 이라면 jsp뒤에 ? 
    					type: 'post', // 길이제한이없는 post전송
    					data: jsonData, // 서버로 전송하는 데이터(JSON) 지정
    					dataType: 'json', // 서버로부터 전달되는 데이터 종류
    					success: function(data){
    						alert(data);
    					}    					
    				});    				
    			}
   				return false;
    		});
    		
    		// 댓글 수정 취소 //클래스 식별 .
    		$('.btnCommentCancel').click(function(e) {
				e.preventDefault();  //return false; 와 같음 function()에 인자는 없음
				
    			$(this).prev().text('수정'); // 내가 클릭하는 취소의 형
    			$(this).prev().prev().css('display', 'inline'); //밑에 없다면 다시 처음으로... = /prev().prev()
    			$(this).css('display', 'none'); // 취소버튼은 사라져야됨
    			
    			//div 형 textarea 다시 수정못하게 
    			
    			var textarea = $(this).parent().prev();
    			
    			textarea.val(content);
    			textarea.attr('readonly', true).focus();
    			textarea.css({
    				'background':'transparent',
    				'outline' : 'none'
    			});    			    		
			});
    	});
    
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
                </tr>
                <% if(article.getFile() == 1){ %>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#"><%= article.getFb().getOriName() %></a>
                        <span><%= article.getFb().getDownload() %>회 다운로드</span>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%= article.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <div>
	         	<% if(mb.getUid().equals(article.getUid())){ %>
	                <a href="#" class="btnDelete">삭제</a>
	                <a href="/Jboard1/modify.jsp" class="btnModify">수정</a>
	            <% } %>
                <a href="/Jboard1/list.jsp" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                
                <% for(ArticleBean comment : comments){ %>
	                <article class="comment">
	                    <span>
	                        <span><%= comment.getNick() %></span>
	                        <span><%= comment.getRdate().substring(2, 10) %></span>
	                    </span>
	                    <!-- readonly 뒤에 : 내가 만든 속성명="데이터"   data-속성="데이터" -->
	                    <textarea name="comment" readonly data-seq="<%= comment.getSeq()%>"><%= comment.getContent() %></textarea>
	                    
	                    <!-- 본인이 쓴 글이 맞으면 -->
	                    <% if(mb.getUid().equals(comment.getUid())){ %>
	                    <div>
	                        <a href="/Jboard1/proc/deleteComment.jsp?parent=<%= comment.getParent() %>&seq=<%= comment.getSeq() %>" class="btnCommentDel">삭제</a>
	                        <a href="#" class="btnCommentModify">수정</a>                       
	                        <a href="#" class="btnCommentCancel">취소</a>                       
	                    </div>
	                    <% } %>
	                </article>
                <% } %>
                
                <% if(comments.size() == 0){ %>
               		 <p class="empty">등록된 댓글이 없습니다.</p>
                <% } %>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard1/proc/commentProc.jsp" method="post">
                	<input type="hidden" name="parent" value="<%= article.getSeq() %>" />
                	<input type="hidden" name="uid" value="<%= mb.getUid() %>" />
                	                
                    <textarea name="content"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>