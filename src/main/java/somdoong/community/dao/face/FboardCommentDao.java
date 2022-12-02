package somdoong.community.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import somdoong.community.dto.FboardComment;
import somdoong.util.Paging2;

public interface FboardCommentDao {

	//댓글 db 삽입
	public void insertComm(FboardComment fcomm);
	
	//게시글 번호에 달린 총 댓글 수 조회
	public int getCntByBno(int bno);
	
	//댓글 목록 조회
	public List<FboardComment> list(@Param("bno") int bno, @Param("start") int start, @Param("end") int end);

	//댓글 상세
	public FboardComment detail(int cno);

	//댓글 수정
	public void update(FboardComment fcomm);

	//댓글 삭제
	public void delete(int cno);

	
	
	

	


}
