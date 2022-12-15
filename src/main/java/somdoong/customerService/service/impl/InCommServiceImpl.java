package somdoong.customerService.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.customerService.dao.face.InCommDao;
import somdoong.customerService.dto.InComm;
import somdoong.customerService.service.face.InCommService;

@Service
public class InCommServiceImpl implements InCommService{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InCommDao inCommDao;
	
	@Override
	public void cmtList(InComm inComm) {
		inCommDao.insert(inComm);
		
	}

	@Override
	public List<InComm> getList(int inum) {
		return inCommDao.selectInCommlistByInum(inum);
	}

	@Override
	public void insertCmt(InComm inComm) {
		inCommDao.insertCmt(inComm);
	}

	@Override
	public void updateCmt(InComm inComm) {
		inCommDao.updateCmt(inComm);
	}

	@Override
	public void deleteCmt(int incno) {
		inCommDao.deleteCmt(incno);
//		inCommDao.deleteChildCmt(inum);
	}
	

}
