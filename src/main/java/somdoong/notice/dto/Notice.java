package somdoong.notice.dto;

import java.util.Date;

public class Notice {

	private int notiNo;
	private String adminId;
	private String notiTitle;
	private String notiContent;
	private int notiHit;
	private Date notiDate;
	
	public Notice () {}
	
	public Notice(int notiNo, String adminId, String notiTitle, String notiContent, int notiHit, Date notiDate) {
		super();
		this.notiNo = notiNo;
		this.adminId = adminId;
		this.notiTitle = notiTitle;
		this.notiContent = notiContent;
		this.notiHit = notiHit;
		this.notiDate = notiDate;
	}

	@Override
	public String toString() {
		return "Notice [notiNo=" + notiNo + ", adminId=" + adminId + ", notiTitle=" + notiTitle + ", notiContent="
				+ notiContent + ", notiHit=" + notiHit + ", notiDate=" + notiDate + "]";
	}

	public int getNotiNo() {
		return notiNo;
	}

	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getNotiTitle() {
		return notiTitle;
	}

	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}

	public String getNotiContent() {
		return notiContent;
	}

	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}

	public int getNotiHit() {
		return notiHit;
	}

	public void setNotiHit(int notiHit) {
		this.notiHit = notiHit;
	}

	public Date getNotiDate() {
		return notiDate;
	}

	public void setNotiDate(Date notiDate) {
		this.notiDate = notiDate;
	}
	
	
	
}
