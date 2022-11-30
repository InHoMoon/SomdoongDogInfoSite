package somdoong.community.dao.face;

import java.util.List;

import somdoong.community.dto.FboardComment;

public interface FboardCommentDao {

	//댓글 db 삽입
	public void insertComm(FboardComment fcomm);

	//게시글 번호에 맞는 댓글 목록 불러오기
	public List<FboardComment> selectClistByBno(int bno);

	//게시글 번호에 달린 총 댓글 수 조회
	public int getCntByBno(int bno);

	//댓글 번호에 맞는 댓글 상세조회
	public FboardComment getDetailByCno(Integer cno);

	public int updateComm(FboardComment fcomm);

	


}
