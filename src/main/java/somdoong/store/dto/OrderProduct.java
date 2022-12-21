package somdoong.store.dto;

import java.util.Date;

public class OrderProduct {

	private int orderNo;
	private Date orderDate;
	private int orderQuantity;
	private String userid;
	private int productNo;
	private int totalPrice;
	private int totalOrderSum;
	private String paymentCla;
	private String memo;
	
	public OrderProduct() {	}

	public OrderProduct(int orderNo, Date orderDate, int orderQuantity, String userid, int productNo, int totalPrice,
			int totalOrderSum, String paymentCla, String memo) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.orderQuantity = orderQuantity;
		this.userid = userid;
		this.productNo = productNo;
		this.totalPrice = totalPrice;
		this.totalOrderSum = totalOrderSum;
		this.paymentCla = paymentCla;
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "OrderProduct [orderNo=" + orderNo + ", orderDate=" + orderDate + ", orderQuantity=" + orderQuantity
				+ ", userid=" + userid + ", productNo=" + productNo + ", totalPrice=" + totalPrice + ", totalOrderSum="
				+ totalOrderSum + ", paymentCla=" + paymentCla + ", memo=" + memo + "]";
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalOrderSum() {
		return totalOrderSum;
	}

	public void setTotalOrderSum(int totalOrderSum) {
		this.totalOrderSum = totalOrderSum;
	}

	public String getPaymentCla() {
		return paymentCla;
	}

	public void setPaymentCla(String paymentCla) {
		this.paymentCla = paymentCla;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}
