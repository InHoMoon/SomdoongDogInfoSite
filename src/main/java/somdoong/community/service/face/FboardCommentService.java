package somdoong.community.service.face;

import java.util.List;

import somdoong.community.dto.FboardComment;
import somdoong.util.Paging;

public interface FboardCommentService {

	//댓글 등록
	public void writeC(FboardComment fcomm);

	//게시물에 대한 댓글 목록
	public List<FboardComment> getList(int bno);

	//게시물에 대한 댓글 수 조회
	public int getTotal(int bno);

	//댓글 상세조회
	public FboardComment detailC(Integer cno);

	public int updateC(FboardComment fcomm);

	


}
