package somdoong.community.dto;

import java.util.Date;

public class Showboard {
	
	private int sno;
	private String title;
	private String content;
	private Date writeDate;
	private int hit;
	private String userid;
	
	public Showboard() {}

	public Showboard(int sno, String title, String content, Date writeDate, int hit, String userid) {
		super();
		this.sno = sno;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.hit = hit;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Showboard [sno=" + sno + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", hit=" + hit + ", userid=" + userid + "]";
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
