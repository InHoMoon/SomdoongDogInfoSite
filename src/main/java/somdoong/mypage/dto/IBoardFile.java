package somdoong.mypage.dto;

public class IBoardFile {

	private int iFileno;
	private int  iNum;
	private String iOriginName;
	private String iStoredName;
	
	public IBoardFile() {
	}

	public IBoardFile(int iFileno, int iNum, String iOriginName, String iStoredName) {
		super();
		this.iFileno = iFileno;
		this.iNum = iNum;
		this.iOriginName = iOriginName;
		this.iStoredName = iStoredName;
	}

	@Override
	public String toString() {
		return "InquireBoardFile [iFileno=" + iFileno + ", iNum=" + iNum + ", iOriginName=" + iOriginName
				+ ", iStoredName=" + iStoredName + "]";
	}

	public int getiFileno() {
		return iFileno;
	}

	public void setiFileno(int iFileno) {
		this.iFileno = iFileno;
	}

	public int getiNum() {
		return iNum;
	}

	public void setiNum(int iNum) {
		this.iNum = iNum;
	}

	public String getiOriginName() {
		return iOriginName;
	}

	public void setiOriginName(String iOriginName) {
		this.iOriginName = iOriginName;
	}

	public String getiStoredName() {
		return iStoredName;
	}

	public void setiStoredName(String iStoredName) {
		this.iStoredName = iStoredName;
	}
	
	
	
}
