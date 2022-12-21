package somdoong.mypage.dto;

import java.sql.Date;

public class Wishlist {
	private int wishListNo;
	private int storeNo;
	private String userid;
	private Date addDate;
	
	
	
	public Wishlist() {
		// TODO Auto-generated constructor stub
	}



	public Wishlist(int wishListNo, int storeNo, String userid, Date addDate) {
		super();
		this.wishListNo = wishListNo;
		this.storeNo = storeNo;
		this.userid = userid;
		this.addDate = addDate;
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



	@Override
	public String toString() {
		return "Wishlist [wishListNo=" + wishListNo + ", storeNo=" + storeNo + ", userid=" + userid + ", addDate="
				+ addDate + "]";
	}

	
	
	
}
