package somdoong.community.dto;

public class RboardFile {
	
	private int rFileno;
	private int rno;
	private String origin_name;
	private String stored_name;
	
	public RboardFile() {}

	public RboardFile(int rFileno, int rno, String origin_name, String stored_name) {
		super();
		this.rFileno = rFileno;
		this.rno = rno;
		this.origin_name = origin_name;
		this.stored_name = stored_name;
	}

	@Override
	public String toString() {
		return "RboardFile [rFileno=" + rFileno + ", rno=" + rno + ", origin_name=" + origin_name + ", stored_name="
				+ stored_name + "]";
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
	
	

}
