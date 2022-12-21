package somdoong.admin.dto;

public class DogInfoFile {

	private int d_fileno;
	private int dno;
	private String originName;
	private String storedName;
	
	public DogInfoFile() {}

	public DogInfoFile(int d_fileno, int dno, String originName, String storedName) {
		super();
		this.d_fileno = d_fileno;
		this.dno = dno;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "DogInfoFile [d_fileno=" + d_fileno + ", dno=" + dno + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getD_fileno() {
		return d_fileno;
	}

	public void setD_fileno(int d_fileno) {
		this.d_fileno = d_fileno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
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
