package com.tt.comment.vo;

public class CommentVO {
	
	private String bcno;
	private String mbno;
	private String mbname;
	private String gname;
	private String bccontent;
	private String bcmakedate;
	private String bcinsertdate;
	private String bcupdatedate;
	private String bcdeleteyn;
	private String ntno;
	private String deno;
	
	public CommentVO(){};
	

	public CommentVO(String bcno, String mbno, String mbname, String gname,
			String bccontent, String bcmakedate, String bcinsertdate,
			String bcupdatedate, String bcdeleteyn, String ntno, String deno) {
		this.bcno = bcno;
		this.mbno = mbno;
		this.mbname = mbname;
		this.gname = gname;
		this.bccontent = bccontent;
		this.bcmakedate = bcmakedate;
		this.bcinsertdate = bcinsertdate;
		this.bcupdatedate = bcupdatedate;
		this.bcdeleteyn = bcdeleteyn;
		this.ntno = ntno;
		this.deno = deno;
	}


	public String getBcno() {
		return bcno;
	}
	public void setBcno(String bcno) {
		this.bcno = bcno;
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

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getBccontent() {
		return bccontent;
	}
	public void setBccontent(String bccontent) {
		this.bccontent = bccontent;
	}
	public String getBcmakedate() {
		return bcmakedate;
	}
	public void setBcmakedate(String bcmakedate) {
		this.bcmakedate = bcmakedate;
	}
	public String getBcinsertdate() {
		return bcinsertdate;
	}
	public void setBcinsertdate(String bcinsertdate) {
		this.bcinsertdate = bcinsertdate;
	}
	public String getBcupdatedate() {
		return bcupdatedate;
	}
	public void setBcupdatedate(String bcupdatedate) {
		this.bcupdatedate = bcupdatedate;
	}
	public String getBcdeleteyn() {
		return bcdeleteyn;
	}
	public void setBcdeleteyn(String bcdeleteyn) {
		this.bcdeleteyn = bcdeleteyn;
	}
	public String getNtno() {
		return ntno;
	}
	public void setNtno(String ntno) {
		this.ntno = ntno;
	}
	public String getDeno() {
		return deno;
	}
	public void setDeno(String deno) {
		this.deno = deno;
	}
	

}
