package somdoong.admin.service.face;

import somdoong.admin.dto.InComm;

public interface InCommService {

	//댓글 등록
	public void writeIn(InComm incomm);
	
	//게시물에 대한 댓글 수 조회
	public int getTotal(int inum);
	
	//댓글 수정
	public void update(InComm inComm);
	
	//댓글 삭제
	public void delete(int incno);	
	
}
