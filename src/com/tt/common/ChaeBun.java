package com.tt.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ChaeBun {
	
	public static final String GUBUN_CHAR_N = "N";
	public static final String CHAEBUN_QUERY[] = {	"SELECT  /*INDEX_DESC(A SYS_C0012505)*/" 
																		+ "NVL(MAX(SUBSTR(A.NTNO,2)),0)+1 FROM NTBOARD A "};
	
	public static String ntNo(){
		System.out.println("ntNo() >>>");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String ntNo = "";
		
		try {
			conn = ConnProperty.getConnection();
			pstmt = conn.prepareStatement(CHAEBUN_QUERY[0]);
			rs = pstmt.executeQuery();
			
			if(rs != null){
				while(rs.next()){
					ntNo = String.valueOf(rs.getInt(1));
				}
			}
			
			if(1==ntNo.length()){
				ntNo = "000"+ntNo;
			}
			if(2==ntNo.length()){
				ntNo = "00"+ntNo;
			}
			if(3==ntNo.length()){
				ntNo = "0"+ntNo;
			}
			
			ntNo = GUBUN_CHAR_N + ntNo;
			
			System.out.println("ntNo >>> : " + ntNo);
			ConnProperty.conClose(conn, pstmt, rs);
			
		} catch (Exception e) {
			System.out.println("ntNo 채번 에러"+e);
			// TODO: handle exception
		}finally{
			try {
				ConnProperty.conClose(conn, pstmt, rs);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return ntNo;
	}
	
	public static void main(String[] args) {
		String aa = ChaeBun.ntNo();
		System.out.println("aa >>>> " + aa);
	}
	
	
}
