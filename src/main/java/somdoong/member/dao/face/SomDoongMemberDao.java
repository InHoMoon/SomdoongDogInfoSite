package somdoong.member.dao.face;

import somdoong.member.dto.SomDoongMember;

public interface SomDoongMemberDao {

	public void insert(SomDoongMember joinproc);

	public int selectCntMember(SomDoongMember member);

	public String selectName(SomDoongMember member);

	public int idcheck(SomDoongMember member);

	public SomDoongMember memberIdSearch(SomDoongMember searchMember);

	public SomDoongMember memberPwSearch(SomDoongMember searchMember);

	

	



	

}
