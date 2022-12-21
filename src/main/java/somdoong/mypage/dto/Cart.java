package somdoong.mypage.dto;

public class Cart {

	private int cId;
	private int productNo;
	private String userid;
	private int cAmount;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cId, int productNo, String userid, int cAmount) {
		super();
		this.cId = cId;
		this.productNo = productNo;
		this.userid = userid;
		this.cAmount = cAmount;
	}

	@Override
	public String toString() {
		return "Cart [cId=" + cId + ", productNo=" + productNo + ", userid=" + userid + ", cAmount=" + cAmount + "]";
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getcAmount() {
		return cAmount;
	}

	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}
	
	
	
	
	
	
	
	
}
