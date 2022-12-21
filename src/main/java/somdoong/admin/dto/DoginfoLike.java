package somdoong.admin.dto;

public class DoginfoLike {
	
	private int d_likeno;
	private int dno;
	private String userid;
	
	public DoginfoLike() {
	}

	public DoginfoLike(int d_likeno, int dno, String userid) {
		super();
		this.d_likeno = d_likeno;
		this.dno = dno;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "DoginfoLike [d_likeno=" + d_likeno + ", dno=" + dno + ", userid=" + userid + "]";
	}

	public int getD_likeno() {
		return d_likeno;
	}

	public void setD_likeno(int d_likeno) {
		this.d_likeno = d_likeno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	

}
