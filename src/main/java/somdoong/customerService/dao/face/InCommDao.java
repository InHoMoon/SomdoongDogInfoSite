package somdoong.customerService.dao.face;

import java.util.List;

import somdoong.customerService.dto.InComm;

public interface InCommDao {

		//댓글 db 삽입
		public void insert(InComm inComm);
		
		//게시글 번호에 맞는 댓글 목록 불러오기
		public List<InComm> selectInCommlistByInum(int inum);
		
		// 댓글 작성
		public void insertCmt(InComm inComm);

		//댓글 수정
		public void updateCmt(InComm inComm);

		//댓글 삭제
		public void deleteCmt(int incno);
		
		// 자식 댓글 전체 삭제 
//		public void deleteChildCmt(int inum);
}
