package somdoong.community.dto;

import java.util.Date;

public class SboardComm {
	
	private int s_commno;
	private String comm_content;
	private Date comm_date;
	private int sno;
	private String userid;
	
	public SboardComm() {}

	public SboardComm(int s_commno, String comm_content, Date comm_date, int sno, String userid) {
		super();
		this.s_commno = s_commno;
		this.comm_content = comm_content;
		this.comm_date = comm_date;
		this.sno = sno;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "SboardComm [s_commno=" + s_commno + ", comm_content=" + comm_content + ", comm_date=" + comm_date
				+ ", sno=" + sno + ", userid=" + userid + "]";
	}

	public int getS_commno() {
		return s_commno;
	}

	public void setS_commno(int s_commno) {
		this.s_commno = s_commno;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public Date getComm_date() {
		return comm_date;
	}

	public void setComm_date(Date comm_date) {
		this.comm_date = comm_date;
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
