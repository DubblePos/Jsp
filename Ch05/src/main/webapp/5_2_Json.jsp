<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user1 = "{\"uid\":\"A101\", \"name\":\"김유신\", \"hp\":\"010-1234-1111\", \"age\":25}";
	String user2 = "{\"uid\":\"A102\", \"name\":\"김춘추\", \"hp\":\"010-1234-2222\", \"age\":23}";
	String user3 = "{\"uid\":\"A103\", \"name\":\"장보고\", \"hp\":\"010-1234-3333\", \"age\":27}";
	String user4 = "{\"uid\":\"A104\", \"name\":\"강감찬\", \"hp\":\"010-1234-4444\", \"age\":31}";
	String user5 = "{\"uid\":\"A105\", \"name\":\"이순신\", \"hp\":\"010-1234-5555\", \"age\":42}";
	
	String[] users = {user1, user2, user3, user4, user5};

	out.print(Arrays.deepToString(users));
%>