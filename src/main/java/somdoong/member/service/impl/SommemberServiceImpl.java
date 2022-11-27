package somdoong.member.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.member.dao.face.SommemberDao;
import somdoong.member.dto.Sommember;
import somdoong.member.service.face.SommemberService;

@Service
public class SommemberServiceImpl implements SommemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired SommemberDao smemberDao;
	
	@Override
	public boolean login(Sommember smember) {
		int loginChk = smemberDao.selectCntMember(smember);
		logger.info("loginChk : {}", loginChk);
		
		if( loginChk > 0 )	return true;
		return false;
	}
	
	@Override
	public int getUserno(Sommember smember) {
		return smemberDao.selectUserno(smember);
	}

	
}
