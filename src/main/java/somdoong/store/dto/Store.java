package somdoong.store.dto;

import java.util.Date;

public class Store {

	private int storeNo;
	private String productName;
	private String category;
	private String title;
	private String info;
	private int price;
	private int stock;
	private Date reportingDate;
	private int hit;
	private int likepost;
	
	public Store() { }

	public Store(int storeNo, String productName, String category, String title, String info, int price, int stock,
			Date reportingDate, int hit, int likepost) {
		super();
		this.storeNo = storeNo;
		this.productName = productName;
		this.category = category;
		this.title = title;
		this.info = info;
		this.price = price;
		this.stock = stock;
		this.reportingDate = reportingDate;
		this.hit = hit;
		this.likepost = likepost;
	}

	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", productName=" + productName + ", category=" + category + ", title="
				+ title + ", info=" + info + ", price=" + price + ", stock=" + stock + ", reportingDate="
				+ reportingDate + ", hit=" + hit + ", likepost=" + likepost + "]";
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
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
