package kr.co.farmstory1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.farmstory1.bean.MemberBean;
import kr.co.farmstory1.bean.TermsBean;
import kr.co.farmstory1.db.DBConfig;
import kr.co.farmstory1.db.Sql;

public class MemberDao {

	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	public void insertMember() {} 
	
	public TermsBean selectTerms() {
		return null;
	}
	
	public int selectCountUserInfo(int type) {		
		return 0;
	}
	
	public MemberBean selectMember(String uid, String pass) {
		
		MemberBean mb = null; //회원정보가 없다면 밑에 if문이 실행안되고 넘어가서 리턴값은 결국 null
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			ResultSet rs = psmt.executeQuery();
					
			if(rs.next()) {
				mb = new MemberBean();
				mb.setUid(rs.getString(1));
				mb.setPass(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setNick(rs.getString(4));
				mb.setEmail(rs.getString(5));
				mb.setHp(rs.getString(6));
				mb.setGrade(rs.getInt(7));
				mb.setZip(rs.getString(8));
				mb.setAddr1(rs.getString(9));
				mb.setAddr2(rs.getString(10));
				mb.setRegip(rs.getString(11));
				mb.setRdate(rs.getString(12));
			}
			}catch(Exception e){
				e.printStackTrace();
			}
		
		return mb;

	} 
	public void selectMembers() {} 
	public void updateMember() {} 
	public void deleteMember() {} 
	
}
