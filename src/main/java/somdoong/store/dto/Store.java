package somdoong.store.dto;

import java.util.Date;

public class Store {
	
	private int storeNo;
	private int productNo;
	private String category;
	private String title;
	private String info;
	private String content;
	private Date reportingDate;
	private int hit;
	private int likepost;
	
	public Store() { }

	public Store(int storeNo, int productNo, String category, String title, String info, String content,
			Date reportingDate, int hit, int likepost) {
		super();
		this.storeNo = storeNo;
		this.productNo = productNo;
		this.category = category;
		this.title = title;
		this.info = info;
		this.content = content;
		this.reportingDate = reportingDate;
		this.hit = hit;
		this.likepost = likepost;
	}

	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", productNo=" + productNo + ", category=" + category + ", title=" + title
				+ ", info=" + info + ", content=" + content + ", reportingDate=" + reportingDate + ", hit=" + hit
				+ ", likepost=" + likepost + "]";
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReportingDate() {
		return reportingDate;
	}

	public void setReportingDate(Date reportingDate) {
		this.reportingDate = reportingDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getLikepost() {
		return likepost;
	}

	public void setLikepost(int likepost) {
		this.likepost = likepost;
	}
	
}
