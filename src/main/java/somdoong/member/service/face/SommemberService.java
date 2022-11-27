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

	/**
	 * 회원의 닉네임 조회
	 * 
	 * @param member - 닉네임을 조회할 사용자의 정보
	 * @return 사용자의 닉네임
	 */
	public int getUserno(Sommember smember);

	
}
