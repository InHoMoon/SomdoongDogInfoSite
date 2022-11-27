package somdoong.community.dao.face;

import java.util.List;

import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.util.Paging;

public interface FreeboardDao {

	/**
	 * 게시판 전체 행 갯수 조회
	 * 
	 * @return
	 */
	public int selectCntAll();

	
	/**
	 * 페이징을 적용해 게시판 목록 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Freeboard> selectList(Paging paging);


	/**
	 * 조회한 게시글의 조회수를 1 증가
	 * 
	 * @param fboard
	 */
	public void hit(Freeboard fboard);


	/**
	 * 게시글 번호를 이용하여 게시글 조회
	 * 
	 * @param fboard
	 * @return
	 */
	public Freeboard selectBoard(Freeboard fboard);


	/**
	 * 게시글 정보 삽입
	 * 
	 * @param fboard
	 */
	public void insertBoard(Freeboard fboard);


	/**
	 * 첨부파일 정보 삽입
	 * 
	 * @param fboardFile
	 */
	public void insertFile(FboardFile fboardFile);


	/**
	 * 게시글 번호를 이용하여 첨부파일 정보 조회
	 * 
	 * @param fboard
	 * @return
	 */
	public FboardFile selectFileByBoardno(Freeboard fboard);


	/**
	 * 파일번호를 이용하여 첨부파일 정보 조회
	 * 
	 * @param fboardfile
	 * @return
	 */
	public FboardFile selectFileByFileno(FboardFile fboardfile);

}
