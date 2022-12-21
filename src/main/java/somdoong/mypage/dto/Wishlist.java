package somdoong.mypage.dto;

import java.sql.Date;

public class Wishlist {
	private int wishListNo;
	private int storeNo;
	private String userid;
	private Date addDate;
	private String productName;
	private int productNo;
	private String storeName;
	
	
	public Wishlist() {
		// TODO Auto-generated constructor stub
	}


	public Wishlist(int wishListNo, int storeNo, String userid, Date addDate, String productName, int productNo,
			String storeName) {
		super();
		this.wishListNo = wishListNo;
		this.storeNo = storeNo;
		this.userid = userid;
		this.addDate = addDate;
		this.productName = productName;
		this.productNo = productNo;
		this.storeName = storeName;
	}


	public int getWishListNo() {
		return wishListNo;
	}


	public void setWishListNo(int wishListNo) {
		this.wishListNo = wishListNo;
	}


	public int getStoreNo() {
		return storeNo;
	}


	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public Date getAddDate() {
		return addDate;
	}


	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	@Override
	public String toString() {
		return "Wishlist [wishListNo=" + wishListNo + ", storeNo=" + storeNo + ", userid=" + userid + ", addDate="
				+ addDate + ", productName=" + productName + ", productNo=" + productNo + ", storeName=" + storeName
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	

	
	
	
}
