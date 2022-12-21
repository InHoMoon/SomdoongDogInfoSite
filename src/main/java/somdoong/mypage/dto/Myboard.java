package somdoong.mypage.dto;

import java.util.Date;

public class Myboard {

	   private int num;
	   private String title;
	   private String content;
	   private Date writedate;
	   private int hit;
	   private String userid;
	   private int rno;
	   private int sno;
	   private int fno;
	   private String type;
	   
	public Myboard() {
		// TODO Auto-generated constructor stub
	}

	public Myboard(int num, String title, String content, Date writedate, int hit, String userid, int rno, int sno,
			int fno, String type) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.hit = hit;
		this.userid = userid;
		this.rno = rno;
		this.sno = sno;
		this.fno = fno;
		this.type = type;
	}

	@Override
	public String toString() {
		return "Myboard [num=" + num + ", title=" + title + ", content=" + content + ", writedate=" + writedate
				+ ", hit=" + hit + ", userid=" + userid + ", rno=" + rno + ", sno=" + sno + ", fno=" + fno + ", type="
				+ type + "]";
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

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
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

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	   
	
	
	
	
	
}
