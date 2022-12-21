package somdoong.admin.dto;

public class Admin {

	private String adminid;
	private String adminnm;
	private String adminpw;
	
	public Admin() {}

	public Admin(String adminid, String adminnm, String adminpw) {
		super();
		this.adminid = adminid;
		this.adminnm = adminnm;
		this.adminpw = adminpw;
	}

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", adminnm=" + adminnm + ", adminpw=" + adminpw + "]";
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminnm() {
		return adminnm;
	}

	public void setAdminnm(String adminnm) {
		this.adminnm = adminnm;
	}

	public String getAdminpw() {
		return adminpw;
	}

	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}

	
	
	
}