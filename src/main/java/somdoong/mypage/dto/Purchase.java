package somdoong.mypage.dto;

public class Purchase {

	private int pNum;
	private String userid;
	private int pAmount;
	private int productNo;
	private int price;
	private String pName;
	
	
	public Purchase() {
		// TODO Auto-generated constructor stub
	}


	public Purchase(int pNum, String userid, int pAmount, int productNo, int price, String pName) {
		super();
		this.pNum = pNum;
		this.userid = userid;
		this.pAmount = pAmount;
		this.productNo = productNo;
		this.price = price;
		this.pName = pName;
	}


	@Override
	public String toString() {
		return "Purchase [pNum=" + pNum + ", userid=" + userid + ", pAmount=" + pAmount + ", productNo=" + productNo
				+ ", price=" + price + ", pName=" + pName + "]";
	}


	public int getpNum() {
		return pNum;
	}


	public void setpNum(int pNum) {
		this.pNum = pNum;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getpAmount() {
		return pAmount;
	}


	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}
	
	
	
	
	
	
	
}
