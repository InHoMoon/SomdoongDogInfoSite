package somdoong.customerService.dto;

import java.util.Date;

public class InComm {

	private int incno;
	private int iNum;
	private String adminid;
	private String incommContent;
	private Date commDate;
	private int parentno;
	
	public InComm() {}

	public InComm(int incno, int inum, String adminid, String incommContent, Date commDate, int parentno) {
		super();
		this.incno = incno;
		this.iNum = inum;
		this.adminid = adminid;
		this.incommContent = incommContent;
		this.commDate = commDate;
		this.parentno = parentno;
	}

	@Override
	public String toString() {
		return "InComm [incno=" + incno + ", inum=" + iNum + ", adminid=" + adminid + ", incommContent=" + incommContent
				+ ", commDate=" + commDate + ", parentno=" + parentno + "]";
	}

	public int getIncno() {
		return incno;
	}

	public void setIncno(int incno) {
		this.incno = incno;
	}

	public int getInum() {
		return iNum;
	}

	public void setInum(int inum) {
		this.iNum = inum;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getIncommContent() {
		return incommContent;
	}

	public void setIncommContent(String incommContent) {
		this.incommContent = incommContent;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}

	public int getParentno() {
		return parentno;
	}

	public void setParentno(int parentno) {
		this.parentno = parentno;
	}


}
