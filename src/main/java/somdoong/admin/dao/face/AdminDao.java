package somdoong.admin.dao.face;

import somdoong.admin.dto.Admin;
 
public interface AdminDao {
 
	/**
	 * id/pw가 일치하는 사용자 수를 반환한다
	 *  -> 로그인 인증에 활용한다
	 *  
	 * @param admin - 조회할 id/pw 정보
	 * @return 조회된 행 수
	 */
	public int selectCntAdmin(Admin admin);
	
	/**
	 * adminid를 이용하여 nick을 조회한다
	 * 
	 * @param admin - 조회하려는 관리자의 id를 가진 객체
	 * @return 조회된 nick
	 */
	public String selectNick(Admin admin);
 
}
