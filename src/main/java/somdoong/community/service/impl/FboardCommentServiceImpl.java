package somdoong.community.service.impl;


import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	//댓글 등록
	@Override
	public void writeC(FboardComment fcomm) {
		commDao.insertComm(fcomm);
	}
	
	
	//댓글 수 조회(게시글 번호 기준)
	@Override
	public int getTotal(int bno) {
		return commDao.getCntByBno(bno);
	}
	
	
	
	//댓글 목록
	@Override
	public List<FboardComment> list(int bno, int start, int end, HttpSession session) {
		
		List<FboardComment> items = commDao.list(bno, start, end);
		
        // 세션에서 현재 사용자 id값 저장
        String userid = (String) session.getAttribute("userid");
        
        return items; 
	}
	
	
	//댓글 상세
	@Override
	public FboardComment detail(int cno) {
		return commDao.detail(cno);
	}
	
	
	//댓글 수정
	@Override
	public void update(FboardComment fcomm) {
		commDao.update(fcomm);
	}
	
	
	//댓글 삭제
	@Override
	public void delete(int cno) {
		commDao.delete(cno);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
