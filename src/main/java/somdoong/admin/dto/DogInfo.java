package somdoong.admin.dto;

import java.util.Date;

public class DogInfo {
	
	private int dinfono;
	private String adminid;
	private String dinfotitle;
	private String dinfocontent;
	private int dinfohit;
	private Date dinfodate;
	private int dinfolike;
	
	public DogInfo() {}

	public DogInfo(int dinfono, String adminid, String dinfotitle, String dinfocontent, int dinfohit, Date dinfodate,
			int dinfolike) {
		super();
		this.dinfono = dinfono;
		this.adminid = adminid;
		this.dinfotitle = dinfotitle;
		this.dinfocontent = dinfocontent;
		this.dinfohit = dinfohit;
		this.dinfodate = dinfodate;
		this.dinfolike = dinfolike;
	}

	@Override
	public String toString() {
		return "DogInfo [dinfono=" + dinfono + ", adminid=" + adminid + ", dinfotitle=" + dinfotitle + ", dinfocontent="
				+ dinfocontent + ", dinfohit=" + dinfohit + ", dinfodate=" + dinfodate + ", dinfolike=" + dinfolike
				+ "]";
	}

	public int getDinfono() {
		return dinfono;
	}

	public void setDinfono(int dinfono) {
		this.dinfono = dinfono;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getDinfotitle() {
		return dinfotitle;
	}

	public void setDinfotitle(String dinfotitle) {
		this.dinfotitle = dinfotitle;
	}

	public String getDinfocontent() {
		return dinfocontent;
	}

	public void setDinfocontent(String dinfocontent) {
		this.dinfocontent = dinfocontent;
	}

	public int getDinfohit() {
		return dinfohit;
	}

	public void setDinfohit(int dinfohit) {
		this.dinfohit = dinfohit;
	}

	public Date getDinfodate() {
		return dinfodate;
	}

	public void setDinfodate(Date dinfodate) {
		this.dinfodate = dinfodate;
	}

	public int getDinfolike() {
		return dinfolike;
	}

	public void setDinfolike(int dinfolike) {
		this.dinfolike = dinfolike;
	}
	
	

}
