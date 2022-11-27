package somdoong.community.dto;

import java.util.Date;

public class FboardComment {
	
	private int fCommno;
	private int fno;
	private int userno;
	private String userid;
	private String commContent;
	private Date commDate;
	
	public FboardComment() {}

	public FboardComment(int fCommno, int fno, int userno, String userid, String commContent, Date commDate) {
		super();
		this.fCommno = fCommno;
		this.fno = fno;
		this.userno = userno;
		this.userid = userid;
		this.commContent = commContent;
		this.commDate = commDate;
	}

	@Override
	public String toString() {
		return "FboardComment [fCommno=" + fCommno + ", fno=" + fno + ", userno=" + userno + ", userid=" + userid
				+ ", commContent=" + commContent + ", commDate=" + commDate + "]";
	}

	public int getfCommno() {
		return fCommno;
	}

	public void setfCommno(int fCommno) {
		this.fCommno = fCommno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}
	
	

}
