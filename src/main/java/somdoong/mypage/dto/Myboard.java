package somdoong.mypage.dto;

import java.util.Date;

public class Myboard {

	   private int num;
	   private String title;
	   private String content;
	   private Date write_date;
	   private int hit;
	   private String userid;
	   
	   public Myboard() {
		// TODO Auto-generated constructor stub
	}

	public Myboard(int num, String title, String content, Date write_date, int hit, String userid) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.hit = hit;
		this.userid = userid;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	@Override
	public String toString() {
		return "Myboard [num=" + num + ", title=" + title + ", content=" + content + ", write_date=" + write_date
				+ ", hit=" + hit + ", userid=" + userid + "]";
	}
	   
	
	
	
	
	
}
