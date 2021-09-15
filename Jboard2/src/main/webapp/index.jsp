<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${sessionScope.sessMember eq null}">
		<%-- 로그인을 안했을때 --%>
		<jsp:forward page="/user/login.do"/>
	</c:when>
	<c:otherwise>
		<%-- 로그인을 했을때 --%>
		<jsp:forward page="/list.do"/>	
	</c:otherwise>
</c:choose>