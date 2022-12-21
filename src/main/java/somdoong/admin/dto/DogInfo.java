package somdoong.admin.dto;

import java.util.Date;

public class DogInfo {
	
	private int dno;
	private String adminid;
	private String dtitle;
	private String dcontent;
	private int dhit;
	private Date dwritedate;
	private int dlike;
	
	public DogInfo() {}

	public DogInfo(int dno, String adminid, String dtitle, String dcontent, int dhit, Date dwritedate, int dlike) {
		super();
		this.dno = dno;
		this.adminid = adminid;
		this.dtitle = dtitle;
		this.dcontent = dcontent;
		this.dhit = dhit;
		this.dwritedate = dwritedate;
		this.dlike = dlike;
	}

	@Override
	public String toString() {
		return "DogInfo [dno=" + dno + ", adminid=" + adminid + ", dtitle=" + dtitle + ", dcontent=" + dcontent
				+ ", dhit=" + dhit + ", dwritedate=" + dwritedate + ", dlike=" + dlike + "]";
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getDtitle() {
		return dtitle;
	}

	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public int getDhit() {
		return dhit;
	}

	public void setDhit(int dhit) {
		this.dhit = dhit;
	}

	public Date getDwritedate() {
		return dwritedate;
	}

	public void setDwritedate(Date dwritedate) {
		this.dwritedate = dwritedate;
	}

	public int getDlike() {
		return dlike;
	}

	public void setDlike(int dlike) {
		this.dlike = dlike;
	}

	
	
}	