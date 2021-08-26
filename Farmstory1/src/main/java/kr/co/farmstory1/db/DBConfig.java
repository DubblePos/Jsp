package kr.co.farmstory1.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

		// �̱���
		private static DBConfig instance = new DBConfig();
		
		private DBConfig() {}
		
		public static DBConfig getInstance() {
			return instance;
		}
		
		// DB���� //���������� ����� �빮�ڷ�
		private final String HOST = "jdbc:mysql://3.35.238.105:3306/wks194510";
		private final String USER = "wks194510";
		private final String PASS = "1234";
		
		public Connection getConnection() throws Exception {//ClassNotFoundException, SQLException�����ϸ��
			// 1�ܰ�
			Class.forName("com.mysql.jdbc.Driver");
			// 2�ܰ�
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);			
			
			return conn;
		}	
}
