package somdoong.community.dto;

public class RboardFile {
	
	private int rFileno;
	private int rno;
	private String originName;
	private String storedName;
	
	public RboardFile() {}

	public RboardFile(int rFileno, int rno, String originName, String storedName) {
		super();
		this.rFileno = rFileno;
		this.rno = rno;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "RboardFile [rFileno=" + rFileno + ", rno=" + rno + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getrFileno() {
		return rFileno;
	}

	public void setrFileno(int rFileno) {
		this.rFileno = rFileno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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
