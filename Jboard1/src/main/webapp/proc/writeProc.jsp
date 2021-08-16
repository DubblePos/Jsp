<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 데이터 전송
	request.setCharacterEncoding("UTF-8");

	// Multipart 전송 데이터 수신(파일 업로드와 동시에 처리)
	String path = request.getServletContext().getRealPath("/file");
	int maxSize = 1024 * 1024 * 10; // 최대 파일 허용량 10MB
	
	MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	String uid     = mRequest.getParameter("uid");
	String title   = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname   = mRequest.getFilesystemName("fname"); // 첨부파일 이름
	String regip   = request.getRemoteAddr();
	
	int seq = 0;
	
	try{		
		// 1,2단계
		Connection conn = DBConfig.getInstance().getConnection();			
		// 3단계
		Statement stmt = conn.createStatement();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3, fname == null ? 0 : 1);
		psmt.setString(4, uid);
		psmt.setString(5, regip);
		// 4단계
		psmt.executeUpdate();
		ResultSet rs =  stmt.executeQuery(Sql.SELECT_MAX_SEQ);
		
		// 5단계
				if(rs.next()){
					seq = rs.getInt(1);
				}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();
		psmt.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 파일첨부를 했다면  파일 처리작업
	if(fname != null){
		// 파일명 수정
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i); //문자열을 자르는것. i~마지막까지 자름
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile);
		
		// 파일 테이블 INSERT
		
		try{
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, seq);
			psmt.setString(2, fname);
			psmt.setString(3, newName);
			// 4단계
			psmt.executeUpdate();
			// 5단계
			// 6단계
			psmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");

%>