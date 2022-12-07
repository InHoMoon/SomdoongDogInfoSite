package somdoong.mypage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.member.dto.SomDoongMember;
import somdoong.mypage.dao.face.UpdateDao;
import somdoong.mypage.service.face.UpdateService;

@Service
public class UpdateServiceImpl implements UpdateService {

	@Autowired UpdateDao updateDao;
	
	@Override
	public void memberUpdate(SomDoongMember member) {
		
		updateDao.memberUpdate(member);
		
	}
	
	@Override
	public void memberDelete(SomDoongMember member) {
		
		updateDao.memberDelete(member);
		
	}
	
}
