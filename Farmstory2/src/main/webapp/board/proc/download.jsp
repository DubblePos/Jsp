<%@page import="kr.co.farmstory2.bean.FileBean"%>
<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String fseq = request.getParameter("fseq");


	// 파일 정보 Select
	ArticleDao dao = ArticleDao.getInstance();
	FileBean fb = dao.selectFile(fseq);
	
	// 파일 다운로드 카운트 update
	dao.updateFileDownload(fseq);
	
	// response 헤더 수정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fb.getOriName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	// response 객체 파일 스트림 작업
	String path = request.getServletContext().getRealPath("/file");
	File file = new File(path+"/"+fb.getNewName());
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while(true){
		
		int data = bis.read();
		
		// 더이상 읽을 데이터가 없을 경우
		if(data == -1){
			break;
		}
		
		bos.write(data);
	}
	
	bos.close();
	bis.close();
%>