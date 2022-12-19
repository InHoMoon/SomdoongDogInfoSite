package somdoong.store.dto;

import java.util.Date;

public class Store {

	private int storeNo;
	private int productNo;
	private String category;
	private String title;
	private String info;
	private Date reportingDate;
	
	private Product product;
	private ProductImg productImg;
	
	public Store() { }

	public Store(int storeNo, int productNo, String category, String title, String info, Date reportingDate,
			Product product, ProductImg productImg) {
		super();
		this.storeNo = storeNo;
		this.productNo = productNo;
		this.category = category;
		this.title = title;
		this.info = info;
		this.reportingDate = reportingDate;
		this.product = product;
		this.productImg = productImg;
	}

	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", productNo=" + productNo + ", category=" + category + ", title=" + title
				+ ", info=" + info + ", reportingDate=" + reportingDate + ", product=" + product + ", productImg="
				+ productImg + "]";
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

	public Date getReportingDate() {
		return reportingDate;
	}

	public void setReportingDate(Date reportingDate) {
		this.reportingDate = reportingDate;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public ProductImg getProductImg() {
		return productImg;
	}

	public void setProductImg(ProductImg productImg) {
		this.productImg = productImg;
	}
	
	
}
