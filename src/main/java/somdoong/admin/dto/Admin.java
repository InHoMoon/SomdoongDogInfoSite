package somdoong.admin.dto;

public class Admin {

	private String adminid;
	private String adminpw;
	private String nick;
	
	public Admin() {}

	public Admin(String adminid, String adminpw, String nick) {
		super();
		this.adminid = adminid;
		this.adminpw = adminpw;
		this.nick = nick;
	}

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", adminpw=" + adminpw + ", nick=" + nick + "]";
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpw() {
		return adminpw;
	}

	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
}
