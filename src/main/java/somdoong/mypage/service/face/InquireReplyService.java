package somdoong.mypage.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import somdoong.mypage.dto.InquireReply;

public interface InquireReplyService {

	//댓글 등록
	public void Cwrite(InquireReply ireply);
	
	//게시물에 대한 댓글 수 조회
	public int getTotal(int iNum);
	
	//댓글 목록
	public List<InquireReply> list(int iNum, int start, int end, HttpSession session);
	
	//댓글 상세보기
	public InquireReply detail(int incno);
	
	//댓글 수정
	public void update(InquireReply ireply);
	
	//댓글 삭제
	public void delete(int incno);
	
}
