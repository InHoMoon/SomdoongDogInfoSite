package somdoong.main.dto;

public class Showboard {
	
	private int sno;
	private String title;
	private String content;
	private String write_date;
	private int hit;
	private String userid;
	
	public Showboard() {}

	public Showboard(int sno, String title, String content, String write_date, int hit, String userid) {
		super();
		this.sno = sno;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.hit = hit;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Showboard [sno=" + sno + ", title=" + title + ", content=" + content + ", write_date=" + write_date
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

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
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
