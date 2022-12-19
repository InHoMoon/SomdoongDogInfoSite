package somdoong.store.dto;

public class Product {
	
	private int productNo;
	private String productName;
	private int price;
	private int stock;
	
	private ProductImg productImg;
	
	public Product() { }

	public Product(int productNo, String productName, int price, int stock, ProductImg productImg) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.productImg = productImg;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", price=" + price + ", stock="
				+ stock + ", productImg=" + productImg + "]";
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public ProductImg getProductImg() {
		return productImg;
	}

	public void setProductImg(ProductImg productImg) {
		this.productImg = productImg;
	}

}
