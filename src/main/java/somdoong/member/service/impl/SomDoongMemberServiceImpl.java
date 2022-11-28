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

	
	
	


}
