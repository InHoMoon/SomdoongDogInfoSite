package somdoong.notice.service.face;

import java.util.List;

import somdoong.util.Paging;
import somdoong.notice.dto.Notice;

public interface NoticeService {

	/**
	 * 게시글 목록 페이징 객체
	 * 
	 * @param inDate 현제 페이지를 저장하고 있는 페이징 객체
	 * @return 페이징 계산 완료된 페이징 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Notice> list(Paging paging);
	
	//키워드로 리스트 받아오기
	public List<Notice> getList(Paging paging);
	

	//검색 게시물 페이징
	public Paging getPagingSearchCnt(Paging paging);

	
	/**
	 * 게시글 상세보기
	 * 
	 * @param notice - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Notice view(Notice notice);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param notice - 게시글 정보 객체
	 */
	public void write(Notice notice);


	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param notice - 게시글 정보 객체
	 */
	public void update(Notice notice);

	/**
	 * 게시글 삭제
	 * 
	 * @param notice
	 */
	public void delete(Notice notice);
	
}

