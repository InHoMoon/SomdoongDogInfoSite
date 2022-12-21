package somdoong.community.dto;

public class SboardLike {
	
	private int s_likeno;
	private int sno;
	private String userid;
	
	public SboardLike() {}

	public SboardLike(int s_likeno, int sno, String userid) {
		super();
		this.s_likeno = s_likeno;
		this.sno = sno;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "SboardLike [s_likeno=" + s_likeno + ", sno=" + sno + ", userid=" + userid + "]";
	}

	public int getS_likeno() {
		return s_likeno;
	}

	public void setS_likeno(int s_likeno) {
		this.s_likeno = s_likeno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	

}
