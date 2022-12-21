package somdoong.notice.dto;

import java.util.Date;

public class Notice {

	private int notino;
	private String adminid;
	private String ntitle;
	private String ncontent;
	private int hit;
	private Date notidate;
	
	public Notice () {}

	public Notice(int notino, String adminid, String ntitle, String ncontent, int hit, Date notidate) {
		super();
		this.notino = notino;
		this.adminid = adminid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.hit = hit;
		this.notidate = notidate;
	}

	@Override
	public String toString() {
		return "Notice [notino=" + notino + ", adminid=" + adminid + ", ntitle=" + ntitle + ", ncontent=" + ncontent
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

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getNotidate() {
		return notidate;
	}

	public void setNotidate(Date notidate) {
		this.notidate = notidate;
	}


	
}
