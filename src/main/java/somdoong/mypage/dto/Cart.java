package somdoong.mypage.dto;

public class Cart {

	private int c_id;
	private int userno;
	private int product_no;
	private String userid;
	private int c_amount;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int c_id, int userno, int product_no, String userid, int c_amount) {
		super();
		this.c_id = c_id;
		this.userno = userno;
		this.product_no = product_no;
		this.userid = userid;
		this.c_amount = c_amount;
	}

	@Override
	public String toString() {
		return "Cart [c_id=" + c_id + ", userno=" + userno + ", product_no=" + product_no + ", userid=" + userid
				+ ", c_amount=" + c_amount + "]";
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getC_amount() {
		return c_amount;
	}

	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}
	
	
	
	
}
