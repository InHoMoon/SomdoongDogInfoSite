package somdoong.mypage.service.face;

import somdoong.member.dto.SomDoongMember;

public interface UpdateService {

	public void memberUpdate(SomDoongMember member);
	
	public void memberDelete(SomDoongMember member);


	public SomDoongMember getid(SomDoongMember member);

	public SomDoongMember getdeleteid(SomDoongMember member);

}
