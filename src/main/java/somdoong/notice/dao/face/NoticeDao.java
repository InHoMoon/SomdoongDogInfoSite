package somdoong.notice.dao.face;

import java.util.List;

import somdoong.notice.dto.Notice;
import somdoong.util.Paging;

public interface NoticeDao {

	/**
	 * 전체 게시글 수
	 * 
	 * @return
	 */
	public int selectCntAll();
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Notice> selectList(Paging paging);
	
	//검색 리스트
	public List<Notice> selectSearchlist(Paging paging);

		
	//검색 리스트 페이징
	public int getPagingSearchCnt(Paging paging);

	
	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param notice - 조회된 게시글 번호
	 */
	public void hit(Notice notice);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param notice - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Notice selectNotice(Notice notice);
	
	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param notice - 삽입할 게시글 정보
	 */
	public void insertNotice(Notice notice);
	
	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param notice - 수정할 게시글 정보
	 */
	public void updateNotice(Notice notice);
	
	/**
	 * 게시글 삭제
	 * 
	 * @param notice - 삭제할 게시글 번호
	 */
	public void delete(Notice notice);
}

