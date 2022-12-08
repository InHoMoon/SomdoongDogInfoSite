package somdoong.admin.dto;

import java.util.Date;

public class InComm {

	private int incno;
	private int inum;
	private String adminid;
	private String incommContent;
	private Date commDate;
	
	public InComm() {}

	public InComm(int incno, int inum, String adminid, String imcommContent, Date commDate) {
		super();
		this.incno = incno;
		this.inum = inum;
		this.adminid = adminid;
		this.incommContent = imcommContent;
		this.commDate = commDate;
	}

	@Override
	public String toString() {
		return "InComm [incno=" + incno + ", inum=" + inum + ", adminid=" + adminid + ", incommContent=" + incommContent
				+ ", commDate=" + commDate + "]";
	}

	public int getIncno() {
		return incno;
	}

	public void setIncno(int incno) {
		this.incno = incno;
	}

	public int getInum() {
		return inum;
	}

	public void setInum(int inum) {
		this.inum = inum;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getImcommContent() {
		return incommContent;
	}

	public void setImcommContent(String imcommContent) {
		this.incommContent = imcommContent;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}
	
	
	
}
