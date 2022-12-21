package somdoong.admin.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.admin.dao.face.AdminDao;
import somdoong.admin.dto.Admin;
import somdoong.admin.service.face.AdminService;
 
@Service //서비스 빈으로 설정함
public class AdminServiceImpl implements AdminService {
 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminDao adminDao;
	
	@Override
	public boolean login(Admin admin) {
		int loginChk = adminDao.selectCntAdmin(admin);
		logger.info("loginChk : {}", loginChk);
		
		if( loginChk > 0 ) return true;
		return false;
		
	} 
}