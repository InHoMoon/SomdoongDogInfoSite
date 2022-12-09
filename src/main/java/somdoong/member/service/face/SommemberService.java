package somdoong.member.service.face;

import somdoong.member.dto.Sommember;

public interface SommemberService {

	/**
	 * 로그인 인증 처리
	 * 	
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 경과
	 */
	public boolean login(Sommember smember);


	
}
