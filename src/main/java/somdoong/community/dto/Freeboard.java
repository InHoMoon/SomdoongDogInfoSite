package somdoong.community.dto;

import java.util.Date;

public class Freeboard {
	
	private int fno;
	private int userno;
	private String title;
	private String content;
	private String userid;
	private int hit;
	private Date writeDate;
	
	private int commCnt; //댓글수
	private int fiCnt; //첨부파일 유무
	
	public Freeboard() {}

	public Freeboard(int fno, int userno, String title, String content, String userid, int hit, Date writeDate,
			int commCnt, int fiCnt) {
		super();
		this.fno = fno;
		this.userno = userno;
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.hit = hit;
		this.writeDate = writeDate;
		this.commCnt = commCnt;
		this.fiCnt = fiCnt;
	}

	@Override
	public String toString() {
		return "Freeboard [fno=" + fno + ", userno=" + userno + ", title=" + title + ", content=" + content
				+ ", userid=" + userid + ", hit=" + hit + ", writeDate=" + writeDate + ", commCnt=" + commCnt
				+ ", fiCnt=" + fiCnt + "]";
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

	public int getCommCnt() {
		return commCnt;
	}

	public void setCommCnt(int commCnt) {
		this.commCnt = commCnt;
	}

	public int getFiCnt() {
		return fiCnt;
	}

	public void setFiCnt(int fiCnt) {
		this.fiCnt = fiCnt;
	}

	
	
	

}
