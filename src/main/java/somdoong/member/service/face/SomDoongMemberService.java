package somdoong.member.service.face;

import java.util.HashMap;

import somdoong.member.dto.SomDoongMember;

public interface SomDoongMemberService {

	public void join(SomDoongMember joinproc);

	public boolean login(SomDoongMember member);

	public String getUsername(SomDoongMember member);

	public int idcheck(SomDoongMember member);

	public SomDoongMember memberIdSearch(SomDoongMember searchMember);

	public SomDoongMember memberPwdCheck(SomDoongMember searchMember);

	

	

	

	

	
	
	




}
