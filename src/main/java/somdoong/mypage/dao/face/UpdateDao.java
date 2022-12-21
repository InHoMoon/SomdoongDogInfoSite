package somdoong.mypage.dao.face;

import somdoong.member.dto.SomDoongMember;

public interface UpdateDao {

	public void memberUpdate(SomDoongMember member);

	
	public void memberDelete(SomDoongMember member);


	public SomDoongMember selectid(SomDoongMember member);


	public SomDoongMember memberSelect(SomDoongMember member);


	public SomDoongMember memberDeleteGetid(SomDoongMember member);
	
	
}
