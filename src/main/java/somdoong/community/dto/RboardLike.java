package somdoong.community.dto;

public class RboardLike {
	
	private int rLikeno;
	private int rno;
	private String userid;
	
	public RboardLike() {}

	public RboardLike(int rLikeno, int rno, String userid) {
		super();
		this.rLikeno = rLikeno;
		this.rno = rno;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "RboardLike [rLikeno=" + rLikeno + ", rno=" + rno + ", userid=" + userid + "]";
	}

	public int getrLikeno() {
		return rLikeno;
	}

	public void setrLikeno(int rLikeno) {
		this.rLikeno = rLikeno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	

}
