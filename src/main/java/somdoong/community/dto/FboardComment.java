package somdoong.community.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FboardComment {
	
	private int cno;
	private int bno;
	private int userno;
	private String userid;
	private String commContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm")
	private Date commDate;
	
	public FboardComment() {}

	public FboardComment(int cno, int bno, int userno, String userid, String commContent, Date commDate) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.userno = userno;
		this.userid = userid;
		this.commContent = commContent;
		this.commDate = commDate;
	}

	@Override
	public String toString() {
		return "FboardComment [cno=" + cno + ", bno=" + bno + ", userno=" + userno + ", userid=" + userid
				+ ", commContent=" + commContent + ", commDate=" + commDate + "]";
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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
