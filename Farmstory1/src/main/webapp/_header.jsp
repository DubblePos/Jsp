<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	String success = request.getParameter("success");
	String mode = request.getParameter("mode");
	
	// mode값은 기본적으로 l(list) 모드값으로 셋팅
	if(mode == null){
		mode = "l";
	}
	
	// 글쓰기, 글보기, 글수정은 반드시 로그인을 먼저 해야됨
	if(mode.equals("w") || mode.equals("v") || mode.equals("m")){
		if(mb == null){
			response.sendRedirect("/Farmstory1/user/login.jsp?success=102");
			return;
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="/Farmstory1/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	var success = "<%= success %>";
    	
    	if(success == 100){
    		alert('일치하는 회원이 없습니다.\n아이디, 비밀번호를 다시 확인해 주세요.');
    	}else if(success == 101){
    		alert('정상적으로 로그아웃이 되었습니다.');
    	}else if(success == 102){
    		alert('먼저 로그인을 하셔야 합니다.');
    	}
    </script>
    
</head>
<body>
    <div id="wrapper">
        <header>            
            <a href="/Farmstory1" class="logo"><img src="/Farmstory1/img/logo.png" alt="로고"/></a>
            <p>
                <a href="/Farmstory1">HOME |</a>
                <% if(mb == null){ %>
                	<a href="/Farmstory1/user/login.jsp">로그인 |</a>
                	<a href="/Farmstory1/user/terms.jsp">회원가입 |</a>
                <% }else{ %>
                	<a href="/Farmstory1/user/logout.jsp">로그아웃 |</a>
                <% } %>
                <a href="/Farmstory1/community/qna.jsp">고객센터</a>
            </p>
            <img src="/Farmstory1/img/head_txt_img.png" alt="3만원이상 무료배송, 팜카드 10%적립"/>
            <ul class="gnb">
                <li><a href="/Farmstory1/introduction/hello.jsp">팜스토리 소개</a></li>
                <li><a href="/Farmstory1/market/market.jsp"><img src="/Farmstory1/img/head_menu_badge.png" class="badge" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory1/croptalk/story.jsp">농작물이야기</a></li>
                <li><a href="/Farmstory1/event/event.jsp">이벤트</a></li>
                <li><a href="/Farmstory1/community/notice.jsp">커뮤니티</a></li>
            </ul>
        </header>