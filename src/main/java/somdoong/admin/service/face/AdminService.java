package somdoong.admin.service.face;

import somdoong.admin.dto.Admin;
	 
public interface AdminService {
	 
	/**
	 * 로그인 인증 처리
	 * 
	 * @param admin - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Admin admin);
	 
}
