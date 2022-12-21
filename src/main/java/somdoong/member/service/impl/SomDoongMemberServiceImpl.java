package somdoong.member.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.member.dao.face.SomDoongMemberDao;
import somdoong.member.dto.SomDoongMember;
import somdoong.member.service.face.SomDoongMemberService;

@Service
public class SomDoongMemberServiceImpl implements SomDoongMemberService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SomDoongMemberDao somDoongMemberDao;


	@Override
	public void join(SomDoongMember joinproc) {
		
		somDoongMemberDao.insert(joinproc);
		
	}
	
	@Override
	public boolean login(SomDoongMember member) {
		
		int loginChk = somDoongMemberDao.selectCntMember(member);
		logger.info("loginChk : {}", loginChk);
		
		if( loginChk > 0) return true;
		return false;
	}
	
	@Override
	public String getUsername(SomDoongMember member) {
		
		return somDoongMemberDao.selectName(member) ;
	}
	


	
	@Override
	public int idcheck(SomDoongMember member) {

		int result = somDoongMemberDao.idcheck(member);
		
		return result;
	}
	

	@Override
	public SomDoongMember memberIdSearch(SomDoongMember searchMember) {
		
		return somDoongMemberDao.memberIdSearch(searchMember);
	}
	

	@Override
	public SomDoongMember memberPwdCheck(SomDoongMember searchMember) {
		
		return somDoongMemberDao.memberPwSearch(searchMember);
	}

	
	
	


}
