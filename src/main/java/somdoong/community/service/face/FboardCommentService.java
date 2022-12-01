package somdoong.community.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import somdoong.community.dto.FboardComment;

public interface FboardCommentService {

	//댓글 등록
	public void writeC(FboardComment fcomm);
	
	//게시물에 대한 댓글 수 조회
	public int getTotal(int bno);
	
	//댓글 목록
	public List<FboardComment> list(int bno, int start, int end, HttpSession session);
	
	//댓글 상세보기
	public FboardComment detail(int cno);
	
	//댓글 수정
	public void update(FboardComment fcomm);
	
	//댓글 삭제
	public void delete(int cno);

	
	


	

	

	

	

	


}
