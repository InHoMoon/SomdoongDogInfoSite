package somdoong.mypage.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class InquireReply {
	
	private int incno;
	private int iNum;
	private String adminid;
	private String userid;
	private String replyContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm")
	private Date replyDate;
	
	public InquireReply() {}

	public InquireReply(int incno, int iNum, String adminid, String userid, String replyContent, Date replyDate) {
		super();
		this.incno = incno;
		this.iNum = iNum;
		this.adminid = adminid;
		this.userid = userid;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "InquireReply [incno=" + incno + ", iNum=" + iNum + ", adminid=" + adminid + ", userid=" + userid
				+ ", replyContent=" + replyContent + ", replyDate=" + replyDate + "]";
	}

	public int getIncno() {
		return incno;
	}

	public void setIncno(int incno) {
		this.incno = incno;
	}

	public int getiNum() {
		return iNum;
	}

	public void setiNum(int iNum) {
		this.iNum = iNum;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
}
