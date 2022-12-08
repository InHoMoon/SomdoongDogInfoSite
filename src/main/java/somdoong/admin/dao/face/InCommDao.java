package somdoong.admin.dao.face;

import somdoong.admin.dto.InComm;

public interface InCommDao {

	//댓글 db 삽입
		public void insertInComm(InComm inComm);
		
		//게시글 번호에 달린 총 댓글 수 조회
		public int getCntByInum(int inum);

		//댓글 수정
		public void update(InComm inComm);

		//댓글 삭제
		public void delete(int inum);
}
