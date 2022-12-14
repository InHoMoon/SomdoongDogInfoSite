package somdoong.community.dto;

public class FboardFile {
	
	private int fFileno;
	private int fno;
	private String originName;
	private String storedName;
	
	public FboardFile() {}

	public FboardFile(int fFileno, int fno, String originName, String storedName) {
		super();
		this.fFileno = fFileno;
		this.fno = fno;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "FboardFile [fFileno=" + fFileno + ", fno=" + fno + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getfFileno() {
		return fFileno;
	}

	public void setfFileno(int fFileno) {
		this.fFileno = fFileno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
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
