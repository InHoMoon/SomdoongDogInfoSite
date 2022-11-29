package somdoong.mypage.dto;

import java.util.Date;

public class Inquire {

	private int iNum ;
	private String iTitle;
	private String iContent;
	private String iCategory;
	private int ihit;
	private Date iwriteDate;
	
	
	public Inquire() {
		// TODO Auto-generated constructor stub
	}


	public Inquire(int iNum, String iTitle, String iContent, String iCategory, int ihit, Date iwriteDate) {
		super();
		this.iNum = iNum;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iCategory = iCategory;
		this.ihit = ihit;
		this.iwriteDate = iwriteDate;
	}


	@Override
	public String toString() {
		return "Inquire [iNum=" + iNum + ", iTitle=" + iTitle + ", iContent=" + iContent + ", iCategory=" + iCategory
				+ ", ihit=" + ihit + ", iwriteDate=" + iwriteDate + "]";
	}


	public int getiNum() {
		return iNum;
	}


	public void setiNum(int iNum) {
		this.iNum = iNum;
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
	
	
	
	
}
