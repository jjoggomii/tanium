package com.tt.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.sun.istack.internal.logging.Logger;


public class ChaeBun {
	
	static Logger logger = Logger.getLogger(ChaeBun.class);
	
	public static final String GUBUN_CHAR_A = "A";
	public static final String GUBUN_CHAR_N = "N";
	public static final String GUBUN_CHAR_BC = "BC";
	
	public static final String CHAEBUN_QUERY[] = {	"SELECT  /*INDEX_DESC(A SYS_C0012505)*/" 
																		+ "NVL(MAX(SUBSTR(A.NTNO,2)),0)+1 FROM NTBOARD A "
			,"SELECT  /*INDEX_DESC(A SYS_C0012783)*/" 
					+ "NVL(MAX(SUBSTR(A.ATNO,2)),0)+1 FROM ATTABLE A "
					,"SELECT NVL(MAX(SUBSTR(A.BCNO,3)),0)+1 FROM BCTABLE A "};
	
	public static String ntNo(){
		logger.info("공지사항 채번 함수 시작  >>> : ");
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
		logger.info("생성된 채번 >>> :" + ntNo);
		return ntNo;
	}
	
	public static String atNo(){
		logger.info("첨부파일 채번 함수 시작  >>> : ");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String atNo = "";
		
		try {
			conn = ConnProperty.getConnection();
			pstmt = conn.prepareStatement(CHAEBUN_QUERY[1]);
			rs = pstmt.executeQuery();
			
			if(rs != null){
				while(rs.next()){
					atNo = String.valueOf(rs.getInt(1));
				}
			}
			
			if(1==atNo.length()){
				atNo = "000"+atNo;
			}
			if(2==atNo.length()){
				atNo = "00"+atNo;
			}
			if(3==atNo.length()){
				atNo = "0"+atNo;
			}
			
			atNo = GUBUN_CHAR_A + atNo;
			
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
		logger.info("생성된 채번 >>> :" + atNo);
		return atNo;
	}
	
	public static String bcNo(){
		logger.info("댓글 채번 함수 시작  >>> : ");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String bcno = "";
		
		try {
			conn = ConnProperty.getConnection();
			pstmt = conn.prepareStatement(CHAEBUN_QUERY[2]);
			rs = pstmt.executeQuery();
			
			if(rs != null){
				while(rs.next()){
					bcno = String.valueOf(rs.getInt(1));
				}
			}
			
			if(1==bcno.length()){
				bcno = "000"+bcno;
			}
			if(2==bcno.length()){
				bcno = "00"+bcno;
			}
			if(3==bcno.length()){
				bcno = "0"+bcno;
			}
			
			bcno = GUBUN_CHAR_BC + bcno;
			
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
		logger.info("생성된 채번 >>> :" + bcno);
		return bcno;
	}
	
}
