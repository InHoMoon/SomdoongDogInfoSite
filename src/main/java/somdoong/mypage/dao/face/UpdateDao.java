package somdoong.mypage.dao.face;

import somdoong.member.dto.SomDoongMember;

public interface UpdateDao {

	public void memberUpdate(SomDoongMember member);

	
	public void memberDelete(SomDoongMember member);
}
