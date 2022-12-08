package somdoong.admin.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.admin.dao.face.InCommDao;
import somdoong.admin.dto.InComm;
import somdoong.admin.service.face.InCommService;

@Service
public class InCommServiceImpl implements InCommService{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InCommDao  inCommDao;
	
	//댓글 등록
	@Override
	public void writeIn(InComm incomm) {
		inCommDao.insertInComm(incomm);
	}
	
	//댓글 수 조회(게시글 번호 기준)
	@Override
	public int getTotal(int inum) {
		return inCommDao.getCntByInum(inum);
	}
	
	//댓글 수정
	@Override
	public void update(InComm incomm) {
		inCommDao.update(incomm);
	}
	
	
	//댓글 삭제
	@Override
	public void delete(int incno) {
		inCommDao.delete(incno);
	}	

}
