package somdoong.community.dto;

import java.util.Date;

public class Recommendboard {
	
	private int rno;
	private String title;
	private String content;
	private String userid;
	private int hit;
	private Date writeDate;
	private String address;
	private String planame;
	
	private int likeCnt; //좋아요수
	private String fiName; //파일 저장 이름
	
	public Recommendboard() {}

	public Recommendboard(int rno, String title, String content, String userid, int hit, Date writeDate, String address,
			String planame, int likeCnt, String fiName) {
		super();
		this.rno = rno;
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.hit = hit;
		this.writeDate = writeDate;
		this.address = address;
		this.planame = planame;
		this.likeCnt = likeCnt;
		this.fiName = fiName;
	}

	@Override
	public String toString() {
		return "Recommendboard [rno=" + rno + ", title=" + title + ", content=" + content + ", userid=" + userid
				+ ", hit=" + hit + ", writeDate=" + writeDate + ", address=" + address + ", planame=" + planame
				+ ", likeCnt=" + likeCnt + ", fiName=" + fiName + "]";
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPlaname() {
		return planame;
	}

	public void setPlaname(String planame) {
		this.planame = planame;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public String getFiName() {
		return fiName;
	}

	public void setFiName(String fiName) {
		this.fiName = fiName;
	}

	
	


	
	
	
	
	
	

}
