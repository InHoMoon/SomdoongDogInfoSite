package somdoong.mypage.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.mypage.dao.face.InquireReplyDao;
import somdoong.mypage.dto.InquireReply;
import somdoong.mypage.service.face.InquireReplyService;

@Service
public class InquireReplyServiceImpl implements InquireReplyService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireReplyDao inquireReplyDao;
	
	//댓글 등록
	@Override
	public void Cwrite(InquireReply ireply) {
		inquireReplyDao.insertReply(ireply);
	}	
	
	//댓글 수 조회(게시글 번호 기준)
	@Override
	public int getTotal(int iNum) {
		return inquireReplyDao.getCntByINum(iNum);
	}	
	
	//댓글 목록
	@Override
	public List<InquireReply> list(int iNum, int start, int end, HttpSession session) {
		
		List<InquireReply> items = inquireReplyDao.list(iNum, start, end);
		
        // 세션에서 현재 사용자 id값 저장
        String adminid = (String) session.getAttribute("adminid");
        
        return items;
	}
	
	//댓글 상세
	@Override
	public InquireReply detail(int incno) {
		return inquireReplyDao.detail(incno);
	}	
	
	//댓글 수정
	@Override
	public void update(InquireReply ireply) {
		inquireReplyDao.update(ireply);
	}
	
	//댓글 삭제
	@Override
	public void delete(int incno) {
		inquireReplyDao.delete(incno);
	}

}
