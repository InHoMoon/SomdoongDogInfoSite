package somdoong.main.dto;

public class SboardFile {
	
	private int s_fileno;
	private String origin_name;
	private String stored_name;
	private int sno;
	
	public SboardFile() {}

	public SboardFile(int s_fileno, String origin_name, String stored_name, int sno) {
		super();
		this.s_fileno = s_fileno;
		this.origin_name = origin_name;
		this.stored_name = stored_name;
		this.sno = sno;
	}

	@Override
	public String toString() {
		return "SboardFile [s_fileno=" + s_fileno + ", origin_name=" + origin_name + ", stored_name=" + stored_name
				+ ", sno=" + sno + "]";
	}

	public int getS_fileno() {
		return s_fileno;
	}

	public void setS_fileno(int s_fileno) {
		this.s_fileno = s_fileno;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getStored_name() {
		return stored_name;
	}

	public void setStored_name(String stored_name) {
		this.stored_name = stored_name;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}
	
	

}
