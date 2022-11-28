package somdoong.community.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.community.dao.face.FboardCommentDao;
import somdoong.community.dto.FboardComment;
import somdoong.community.service.face.FboardCommentService;

@Service
public class FboardCommentServiceImpl implements FboardCommentService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FboardCommentDao  commDao;
	
	@Override
	public List<FboardComment> getList(int fno) {
		logger.info("댓글목록조회 : {}", commDao.getListByfno(fno));
		return commDao.getListByfno(fno);
	}
	
	@Override
	public int getTotal(int fno) {
		logger.info("댓글수 조회 : {}", commDao.getTotal(fno));
		return commDao.getTotal(fno);
	}

}
