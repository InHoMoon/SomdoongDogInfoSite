package somdoong.notice.dao.face;

import java.util.List;

import somdoong.notice.dto.Notice;
import somdoong.util.Paging;
import somdoong.notice.dto.NoticeFile;

public interface NoticeDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Notice> selectList(Paging paging);
	
	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewNotice - 조회된 게시글 번호
	 */
	public void updateNotiHit(Notice viewNotice);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewNotice - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Notice selectNotice(Notice viewNotice);
	
	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param notice - 삽입할 게시글 정보
	 */
	public void insertNotice(Notice notice);
	
	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param noticeFile
	 */
	public void insertFile(NoticeFile noticeFile);
	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewNotice - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public NoticeFile selectNoticeFileByNotiNo(Notice viewNotice);
	
	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param noticeFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public NoticeFile selectNoticeFileByNFileNo(NoticeFile noticeFile);
	
	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param notice - 수정할 게시글 정보
	 */
	public void updateNotice(Notice notice);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제
	 * 
	 * @param notice - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(Notice notice);
	
	/**
	 * 게시글 삭제
	 * 
	 * @param notice - 삭제할 게시글 번호
	 */
	public void delete(Notice notice);
}

