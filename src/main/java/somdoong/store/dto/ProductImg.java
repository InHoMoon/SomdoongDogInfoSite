package somdoong.store.dto;

public class ProductImg {

	private int imgNo;
	private int storeNo;
	private String originName;
	private String storedName;
	
	public ProductImg() { }

	public ProductImg(int imgNo, int storeNo, String originName, String storedName) {
		super();
		this.imgNo = imgNo;
		this.storeNo = storeNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "ProductImg [imgNo=" + imgNo + ", storeNo=" + storeNo + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	

}
