package somdoong.notice.dto;

import java.sql.Timestamp;

public class Notice {

	private int notino;
	private String adminid;
	private String title;
	private String content;
	private int hit;
	private Timestamp notidate;
	
	public Notice () {}

	public Notice(int notino, String adminid, String title, String content, int hit, Timestamp notidate) {
		super();
		this.notino = notino;
		this.adminid = adminid;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.notidate = notidate;
	}

	@Override
	public String toString() {
		return "Notice [notino=" + notino + ", adminid=" + adminid + ", title=" + title + ", content=" + content
				+ ", hit=" + hit + ", notidate=" + notidate + "]";
	}

	public int getNotino() {
		return notino;
	}

	public void setNotino(int notino) {
		this.notino = notino;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Timestamp getNotidate() {
		return notidate;
	}

	public void setNotidate(Timestamp notidate) {
		this.notidate = notidate;
	}
	
	
}
