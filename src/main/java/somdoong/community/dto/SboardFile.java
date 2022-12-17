package somdoong.community.dto;

public class SboardFile {
	
	private int sFileno;
	private String originName;
	private String storedName;
	private int sno;
	
	public SboardFile() {}

	public SboardFile(int sFileno, String originName, String storedName, int sno) {
		super();
		this.sFileno = sFileno;
		this.originName = originName;
		this.storedName = storedName;
		this.sno = sno;
	}

	@Override
	public String toString() {
		return "SboardFile [sFileno=" + sFileno + ", originName=" + originName + ", storedName=" + storedName + ", sno="
				+ sno + "]";
	}

	public int getsFileno() {
		return sFileno;
	}

	public void setsFileno(int sFileno) {
		this.sFileno = sFileno;
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

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	
	

}
