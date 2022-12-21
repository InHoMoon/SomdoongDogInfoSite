package somdoong.mypage.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import somdoong.mypage.dto.InquireReply;

public interface InquireReplyDao {

	//댓글 db 삽입
	public void insertReply(InquireReply ireply);
	
	//게시글 번호에 달린 총 댓글 수 조회
	public int getCntByINum(int iNum);
	
	//댓글 목록 조회
	public List<InquireReply> list(@Param("iNum") int iNum, @Param("start") int start, @Param("end") int end);

	//댓글 상세
	public InquireReply detail(int incno);

	//댓글 수정
	public void update(InquireReply ireply);

	//댓글 삭제
	public void delete(int incno);
}
