package com.tt.notice.vo;


public class NoticeVO {
	
	private String ntno;
	private String mbno;
	private String gname; //직위명
	private String ntwriter; //작성자 
	private String ntsubject;
	private String ntcontent;
	private int ntviews;
	private String nttop;
	private String ntmakedate;
	private String ntinsertdate;
	private String ntupdatedate;
	private String ntdeleteyn;
	private String atno;
	private String atfilename;
	private String atfilepath;
	private String atdeleteyn;
	
	public NoticeVO(){
		
	}

	public NoticeVO(String ntno, String mbno, String gname, String ntwriter,
			String ntsubject, String ntcontent, int ntviews, String nttop,
			String ntmakedate, String ntinsertdate, String ntupdatedate,
			String ntdeleteyn, String atno, String atfilename,
			String atfilepath, String atdeleteyn) {

		this.ntno = ntno;
		this.mbno = mbno;
		this.gname = gname;
		this.ntwriter = ntwriter;
		this.ntsubject = ntsubject;
		this.ntcontent = ntcontent;
		this.ntviews = ntviews;
		this.nttop = nttop;
		this.ntmakedate = ntmakedate;
		this.ntinsertdate = ntinsertdate;
		this.ntupdatedate = ntupdatedate;
		this.ntdeleteyn = ntdeleteyn;
		this.atno = atno;
		this.atfilename = atfilename;
		this.atfilepath = atfilepath;
		this.atdeleteyn = atdeleteyn;
	}





	public String getNtno() {
		return ntno;
	}

	public void setNtno(String ntno) {
		this.ntno = ntno;
	}

	public String getMbno() {
		return mbno;
	}

	public void setMbno(String mbno) {
		this.mbno = mbno;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getNtwriter() {
		return ntwriter;
	}

	public void setNtwriter(String ntwriter) {
		this.ntwriter = ntwriter;
	}

	public String getNtsubject() {
		return ntsubject;
	}

	public void setNtsubject(String ntsubject) {
		this.ntsubject = ntsubject;
	}

	public String getNtcontent() {
		return ntcontent;
	}

	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}

	public int getNtviews() {
		return ntviews;
	}

	public void setNtviews(int ntviews) {
		this.ntviews = ntviews;
	}

	public String getNttop() {
		return nttop;
	}

	public void setNttop(String nttop) {
		this.nttop = nttop;
	}

	public String getNtmakedate() {
		return ntmakedate;
	}

	public void setNtmakedate(String ntmakedate) {
		this.ntmakedate = ntmakedate;
	}

	public String getNtinsertdate() {
		return ntinsertdate;
	}

	public void setNtinsertdate(String ntinsertdate) {
		this.ntinsertdate = ntinsertdate;
	}

	public String getNtupdatedate() {
		return ntupdatedate;
	}

	public void setNtupdatedate(String ntupdatedate) {
		this.ntupdatedate = ntupdatedate;
	}

	public String getNtdeleteyn() {
		return ntdeleteyn;
	}

	public void setNtdeleteyn(String ntdeleteyn) {
		this.ntdeleteyn = ntdeleteyn;
	}


	public String getAtno() {
		return atno;
	}

	public void setAtno(String atno) {
		this.atno = atno;
	}

	public String getAtfilename() {
		return atfilename;
	}

	public void setAtfilename(String atfilename) {
		this.atfilename = atfilename;
	}

	public String getAtfilepath() {
		return atfilepath;
	}

	public void setAtfilepath(String atfilepath) {
		this.atfilepath = atfilepath;
	}

	public String getAtdeleteyn() {
		return atdeleteyn;
	}

	public void setAtdeleteyn(String atdeleteyn) {
		this.atdeleteyn = atdeleteyn;
	}

	

}
