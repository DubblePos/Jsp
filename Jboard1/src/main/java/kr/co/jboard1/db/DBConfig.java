package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

		// 싱글톤
		private static DBConfig instance = new DBConfig();
		
		private DBConfig() {}
		
		public static DBConfig getInstance() {
			return instance;
		}
		
		// DB정보 //관례적으로 상수는 대문자로
		private final String HOST = "jdbc:mysql://54.180.160.240:3306/wks194510";
		private final String USER = "wks194510";
		private final String PASS = "1234";
		
		public Connection getConnection() throws Exception {//ClassNotFoundException, SQLException통합하면됨
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);			
			
			return conn;
		}	
}
