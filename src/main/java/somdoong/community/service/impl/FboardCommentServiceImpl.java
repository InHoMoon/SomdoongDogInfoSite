package somdoong.community.service.impl;


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
	public void writeC(FboardComment fcomm) {
		commDao.insertComm(fcomm);
	}
	

}
