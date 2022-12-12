package somdoong.main.dto;

import java.util.Date;

public class Freeboard {
	
	   private int fno;
	   private String title;
	   private String content;
	   private Date write_date;
	   private int hit;
	   private String userid;
	   
	   
	   public Freeboard() {
		// TODO Auto-generated constructor stub
	}


	public Freeboard(int fno, String title, String content, Date write_date, int hit, String userid) {
		super();
		this.fno = fno;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.hit = hit;
		this.userid = userid;
	}


	@Override
	public String toString() {
		return "Freeboard [fno=" + fno + ", title=" + title + ", content=" + content + ", write_date=" + write_date
				+ ", hit=" + hit + ", userid=" + userid + "]";
	}


	public int getFno() {
		return fno;
	}


	public void setFno(int fno) {
		this.fno = fno;
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


	public Date getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
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
