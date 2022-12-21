package somdoong.store.dto;

public class WishList {

	private int wishlistNo;
	private int storeNo;
	private String userid;
	private String addDate;
	
	public WishList() { }

	public WishList(int wishlistNo, int storeNo, String userid, String addDate) {
		super();
		this.wishlistNo = wishlistNo;
		this.storeNo = storeNo;
		this.userid = userid;
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "WishList [wishlistNo=" + wishlistNo + ", storeNo=" + storeNo + ", userid=" + userid + ", addDate="
				+ addDate + "]";
	}

	public int getWishlistNo() {
		return wishlistNo;
	}

	public void setWishlistNo(int wishlistNo) {
		this.wishlistNo = wishlistNo;
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

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

}
