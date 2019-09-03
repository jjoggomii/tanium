package com.tt.member.vo;

import org.springframework.web.multipart.MultipartFile;


	public class MemberVO{
		
	private String mbno;		//	사원번호	
	private String mbname;		// 	사원이름
	private String mbpw;		// 	비밀번호 = > 사원 생년월일
	private String mbgender;	//  성별
	private String mbtel;		// 	휴대폰번호
	private String mbbirth;		// 	생년월일
	private String mbemail;		//	이메일
	private String mbaddr;		//	주소
	private String mbpostcode;		//	우편번호
	private String mbhobby;		//	취미
	private String mbmarry;		//	결혼여부
	private String mbjoindate;	//	입사일자
	private String mbresingation;	//	퇴사일자
	private String dname;			//	부서명
	private String gname;			//	직위명
	private String pname;			//	직책명
	private String rname;			//	직급명
	private String tname;			//	팀명
	private String mbpicture;		//	사원사진
	private String mbstamp;			//	사원도장
	private String mbinsertdate;	//	등록일자
	private String mbupdatedate;	//	수정일자
	private String mbdeleteyn;		// 	삭제여부
	private MultipartFile picture;
	private MultipartFile stamp;
	
	public MemberVO(){}
	
	public MemberVO(String mbno, String mbname, String mbpw, String mbgender,
			String mbtel, String mbbirth, String mbemail, String mbaddr,
			String mbpostcode, String mbhobby, String mbmarry, String mbjoindate,
			String mbresingation, String dname, String gname, String pname,
			String rname, String tname, String mbpicture, String mbstamp,
			String mbinsertdate, String mbupdatedate, String mbdeleteyn,
			MultipartFile picture, MultipartFile stamp) {
	
		this.mbno = mbno;
		this.mbname = mbname;
		this.mbpw = mbpw;
		this.mbgender = mbgender;
		this.mbtel = mbtel;
		this.mbbirth = mbbirth;
		this.mbemail = mbemail;
		this.mbaddr = mbaddr;
		this.mbpostcode = mbpostcode;
		this.mbhobby = mbhobby;
		this.mbmarry = mbmarry;
		this.mbjoindate = mbjoindate;
		this.mbresingation = mbresingation;
		this.dname = dname;
		this.gname = gname;
		this.pname = pname;
		this.rname = rname;
		this.tname = tname;
		this.mbpicture = mbpicture;
		this.mbstamp = mbstamp;
		this.mbinsertdate = mbinsertdate;
		this.mbupdatedate = mbupdatedate;
		this.mbdeleteyn = mbdeleteyn;
		this.picture = picture;
		this.stamp = stamp;
	}
	public String getMbno() {
		return mbno;
	}
	public void setMbno(String mbno) {
		this.mbno = mbno;
	}
	public String getMbname() {
		return mbname;
	}
	public void setMbname(String mbname) {
		this.mbname = mbname;
	}
	public String getMbpw() {
		return mbpw;
	}
	public void setMbpw(String mbpw) {
		this.mbpw = mbpw;
	}
	public String getMbgender() {
		return mbgender;
	}
	public void setMbgender(String mbgender) {
		this.mbgender = mbgender;
	}
	public String getMbtel() {
		return mbtel;
	}
	public void setMbtel(String mbtel) {
		this.mbtel = mbtel;
	}
	public String getMbbirth() {
		return mbbirth;
	}
	public void setMbbirth(String mbbirth) {
		this.mbbirth = mbbirth;
	}
	public String getMbemail() {
		return mbemail;
	}
	public void setMbemail(String mbemail) {
		this.mbemail = mbemail;
	}
	public String getMbaddr() {
		return mbaddr;
	}
	public void setMbaddr(String mbaddr) {
		this.mbaddr = mbaddr;
	}
	public String getMbpostcode() {
		return mbpostcode;
	}
	public void setMbpostcode(String mbpostcode) {
		this.mbpostcode = mbpostcode;
	}
	public String getMbhobby() {
		return mbhobby;
	}
	public void setMbhobby(String mbhobby) {
		this.mbhobby = mbhobby;
	}
	public String getMbmarry() {
		return mbmarry;
	}
	public void setMbmarry(String mbmarry) {
		this.mbmarry = mbmarry;
	}
	public String getMbjoindate() {
		return mbjoindate;
	}
	public void setMbjoindate(String mbjoindate) {
		this.mbjoindate = mbjoindate;
	}
	public String getMbresingation() {
		return mbresingation;
	}
	public void setMbresingation(String mbresingation) {
		this.mbresingation = mbresingation;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getMbpicture() {
		return mbpicture;
	}
	public void setMbpicture(String mbpicture) {
		this.mbpicture = mbpicture;
	}
	public String getMbstamp() {
		return mbstamp;
	}
	public void setMbstamp(String mbstamp) {
		this.mbstamp = mbstamp;
	}
	public String getMbinsertdate() {
		return mbinsertdate;
	}
	public void setMbinsertdate(String mbinsertdate) {
		this.mbinsertdate = mbinsertdate;
	}
	public String getMbupdatedate() {
		return mbupdatedate;
	}
	public void setMbupdatedate(String mbupdatedate) {
		this.mbupdatedate = mbupdatedate;
	}
	public String getMbdeleteyn() {
		return mbdeleteyn;
	}
	public void setMbdeleteyn(String mbdeleteyn) {
		this.mbdeleteyn = mbdeleteyn;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public MultipartFile getStamp() {
		return stamp;
	}
	public void setStamp(MultipartFile stamp) {
		this.stamp = stamp;
	}
	
}

