package somdoong.member.dto;

public class Sommember {
	
	private int userno;
	private String userid;
	private String userpw;
	private String username;
	private String userphone;
	private String useradd;
	private String useraddd;
	private String email;
	
	public Sommember() {}

	public Sommember(int userno, String userid, String userpw, String username, String userphone, String useradd,
			String useraddd, String email) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphone = userphone;
		this.useradd = useradd;
		this.useraddd = useraddd;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Sommember [userno=" + userno + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", userphone=" + userphone + ", useradd=" + useradd + ", useraddd=" + useraddd + ", email=" + email
				+ "]";
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUseradd() {
		return useradd;
	}

	public void setUseradd(String useradd) {
		this.useradd = useradd;
	}

	public String getUseraddd() {
		return useraddd;
	}

	public void setUseraddd(String useraddd) {
		this.useraddd = useraddd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
