package somdoong.member.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.member.dao.face.MemberDao;
import somdoong.member.dto.SomMember;
import somdoong.member.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberDao memberDao;
	
	@Override
	public boolean login(SomMember member) {
		logger.info("login() 실행");
		
		if(memberDao.selectId(member) > 0) {
			return true;
		}
		
		return false;
	}

}
