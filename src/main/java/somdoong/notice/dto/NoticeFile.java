package somdoong.notice.dto;

public class NoticeFile {

	private int nFileNo;
	private String originName;
	private String StoredName;
	
	public NoticeFile() {}

	public NoticeFile(int nFileNo, String originName, String storedName) {
		super();
		this.nFileNo = nFileNo;
		this.originName = originName;
		StoredName = storedName;
	}

	@Override
	public String toString() {
		return "NoticeFile [nFileNo=" + nFileNo + ", originName=" + originName + ", StoredName=" + StoredName + "]";
	}

	public int getnFileNo() {
		return nFileNo;
	}

	public void setnFileNo(int nFileNo) {
		this.nFileNo = nFileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return StoredName;
	}

	public void setStoredName(String storedName) {
		StoredName = storedName;
	}

}
