package somdoong.mypage.dto;

import java.util.Date;

public class Inquire {

	private int iNum ;
	private int userno;
	private String iUsername;
	private String iUserid;
	private String iTitle;
	private String iContent;
	private String iCategory;
	private int ihit;
	private Date iwriteDate;
	
	private int commCnt;
	
	
	public Inquire() {
		// TODO Auto-generated constructor stub
	}


	public Inquire(int iNum, int userno, String iUsername, String iUserid, String iTitle, String iContent,
			String iCategory, int ihit, Date iwriteDate, int commCnt) {
		super();
		this.iNum = iNum;
		this.userno = userno;
		this.iUsername = iUsername;
		this.iUserid = iUserid;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iCategory = iCategory;
		this.ihit = ihit;
		this.iwriteDate = iwriteDate;
		this.commCnt = commCnt;
	}


	@Override
	public String toString() {
		return "Inquire [iNum=" + iNum + ", userno=" + userno + ", iUsername=" + iUsername + ", iUserid=" + iUserid
				+ ", iTitle=" + iTitle + ", iContent=" + iContent + ", iCategory=" + iCategory + ", ihit=" + ihit
				+ ", iwriteDate=" + iwriteDate + ", commCnt=" + commCnt + "]";
	}


	public int getiNum() {
		return iNum;
	}


	public void setiNum(int iNum) {
		this.iNum = iNum;
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}


	public String getiUsername() {
		return iUsername;
	}


	public void setiUsername(String iUsername) {
		this.iUsername = iUsername;
	}


	public String getiUserid() {
		return iUserid;
	}


	public void setiUserid(String iUserid) {
		this.iUserid = iUserid;
	}


	public String getiTitle() {
		return iTitle;
	}


	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}


	public String getiContent() {
		return iContent;
	}


	public void setiContent(String iContent) {
		this.iContent = iContent;
	}


	public String getiCategory() {
		return iCategory;
	}


	public void setiCategory(String iCategory) {
		this.iCategory = iCategory;
	}


	public int getIhit() {
		return ihit;
	}


	public void setIhit(int ihit) {
		this.ihit = ihit;
	}


	public Date getIwriteDate() {
		return iwriteDate;
	}


	public void setIwriteDate(Date iwriteDate) {
		this.iwriteDate = iwriteDate;
	}


	public int getCommCnt() {
		return commCnt;
	}


	public void setCommCnt(int commCnt) {
		this.commCnt = commCnt;
	}

	
}
