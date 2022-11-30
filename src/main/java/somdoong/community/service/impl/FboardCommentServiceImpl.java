package somdoong.community.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.community.dao.face.FboardCommentDao;
import somdoong.community.dto.FboardComment;
import somdoong.community.service.face.FboardCommentService;
import somdoong.util.Paging;

@Service
public class FboardCommentServiceImpl implements FboardCommentService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FboardCommentDao  commDao;
	
	
	@Override
	public void writeC(FboardComment fcomm) {
		commDao.insertComm(fcomm);
	}
	
	
	@Override
	public List<FboardComment> getList(int bno) {
		return commDao.selectClistByBno(bno);
	}
	
	
	@Override
	public int getTotal(int bno) {
		return commDao.getCntByBno(bno);
	}
	
	
	@Override
	public FboardComment detailC(Integer cno) {
		return commDao.getDetailByCno(cno);
	}
	
	
	@Override
	public int updateC(FboardComment fcomm) {
		return commDao.updateComm(fcomm);
	}

}
