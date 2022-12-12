package somdoong.community.dto;

import java.util.Date;

public class Recommendboard {
	
	private int rno;
	private int userno;
	private String title;
	private String content;
	private String userid;
	private int hit;
	private Date writeDate;
	private String address;
	private String planame;
	
	public Recommendboard() {}

	public Recommendboard(int rno, int userno, String title, String content, String userid, int hit, Date writeDate,
			String address, String planame) {
		super();
		this.rno = rno;
		this.userno = userno;
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.hit = hit;
		this.writeDate = writeDate;
		this.address = address;
		this.planame = planame;
	}

	@Override
	public String toString() {
		return "Recommendboard [rno=" + rno + ", userno=" + userno + ", title=" + title + ", content=" + content
				+ ", userid=" + userid + ", hit=" + hit + ", writeDate=" + writeDate + ", address=" + address
				+ ", planame=" + planame + "]";
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
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

	
	
	
	

}
