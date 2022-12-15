package somdoong.notice.dto;

public class NoticeFile {

	private int fileNo;
	private int notino;
	private String originName;
	private String storedName;
	
	public NoticeFile() {}

	public NoticeFile(int fileNo, int notino, String originName, String storedName) {
		super();
		this.fileNo = fileNo;
		this.notino = notino;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "NoticeFile [fileNo=" + fileNo + ", notino=" + notino + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getNotino() {
		return notino;
	}

	public void setNotino(int notino) {
		this.notino = notino;
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
