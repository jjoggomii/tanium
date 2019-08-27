package com.tt.vr.vo;

public class VrVO {
	

	private String vrno;			//휴가신청서 문서번호
	private String mbno;			//기안자 사번
	private String vrwriter;		//기안자 이름
	private String dname;			//기안자 부서명
	private String tname; 			//팀명
	private String gname; 			//직위명
	private String pname; 			//직책명
	private String vrsubject; 		//제목
	private String vrmakedate; 		//기안일
	private String bdstate; 		//진행상태
	private String vrtype; 			//휴가종류
	private String vrstartdate;		//시작일 
	private String vrenddate; 		//종료일
	private String vrcontent;		//휴가사유
	private String vrinsertdate;	//생성일
	private String vrupdatedate;	//수정일
	private String vrdeleteyn;		//삭제여부
	
	public VrVO() {
	}
	
	public VrVO(String vrno, String mbno, String vrwriter, String dname,
			String tname, String gname, String pname, String vrsubject,
			String vrmakedate, String bdstate, String vrtype,
			String vrstartdate, String vrenddate, String vrcontent,
			String vrinsertdate, String vrupdatedate, String vrdeleteyn) {
		this.vrno = vrno;
		this.mbno = mbno;
		this.vrwriter = vrwriter;
		this.dname = dname;
		this.tname = tname;
		this.gname = gname;
		this.pname = pname;
		this.vrsubject = vrsubject;
		this.vrmakedate = vrmakedate;
		this.bdstate = bdstate;
		this.vrtype = vrtype;
		this.vrstartdate = vrstartdate;
		this.vrenddate = vrenddate;
		this.vrcontent = vrcontent;
		this.vrinsertdate = vrinsertdate;
		this.vrupdatedate = vrupdatedate;
		this.vrdeleteyn = vrdeleteyn;
	}
	public String getVrno() {
		return vrno;
	}
	public void setVrno(String vrno) {
		this.vrno = vrno;
	}
	public String getMbno() {
		return mbno;
	}
	public void setMbno(String mbno) {
		this.mbno = mbno;
	}
	public String getVrwriter() {
		return vrwriter;
	}
	public void setVrwriter(String vrwriter) {
		this.vrwriter = vrwriter;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
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
	public String getVrsubject() {
		return vrsubject;
	}
	public void setVrsubject(String vrsubject) {
		this.vrsubject = vrsubject;
	}
	public String getVrmakedate() {
		return vrmakedate;
	}
	public void setVrmakedate(String vrmakedate) {
		this.vrmakedate = vrmakedate;
	}
	public String getBdstate() {
		return bdstate;
	}
	public void setBdstate(String bdstate) {
		this.bdstate = bdstate;
	}
	public String getVrtype() {
		return vrtype;
	}
	public void setVrtype(String vrtype) {
		this.vrtype = vrtype;
	}
	public String getVrstartdate() {
		return vrstartdate;
	}
	public void setVrstartdate(String vrstartdate) {
		this.vrstartdate = vrstartdate;
	}
	public String getVrenddate() {
		return vrenddate;
	}
	public void setVrenddate(String vrenddate) {
		this.vrenddate = vrenddate;
	}
	public String getVrcontent() {
		return vrcontent;
	}
	public void setVrcontent(String vrcontent) {
		this.vrcontent = vrcontent;
	}
	public String getVrinsertdate() {
		return vrinsertdate;
	}
	public void setVrinsertdate(String vrinsertdate) {
		this.vrinsertdate = vrinsertdate;
	}
	public String getVrupdatedate() {
		return vrupdatedate;
	}
	public void setVrupdatedate(String vrupdatedate) {
		this.vrupdatedate = vrupdatedate;
	}
	public String getVrdeleteyn() {
		return vrdeleteyn;
	}
	public void setVrdeleteyn(String vrdeleteyn) {
		this.vrdeleteyn = vrdeleteyn;
	}

}
