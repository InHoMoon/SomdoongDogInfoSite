package somdoong.community.dao.face;

import java.util.List;

import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.community.util.Paging_f;

public interface FreeboardDao {

	//게시판 전체 행 갯수 조회
	public int selectCntAll();

	
	//페이징을 적용해 게시판 목록 조회
	public List<Freeboard> selectList(Paging_f paging);


	//조회한 게시글의 조회수를 1 증가
	public void hit(Freeboard fboard);


	//게시글 번호를 이용하여 게시글 조회
	public Freeboard selectBoard(Freeboard fboard);


	//게시글 정보 삽입
	public void insertBoard(Freeboard fboard);


	//첨부파일 정보 삽입
	public void insertFile(FboardFile fboardFile);


	//게시글 번호를 이용하여 첨부파일 정보 조회
	public FboardFile selectFileByBoardno(Freeboard fboard);


	//파일번호를 이용하여 첨부파일 정보 조회
	public FboardFile selectFileByFileno(FboardFile fboardfile);


	//검색 리스트
	public List<Freeboard> selectSearchlist(Paging_f paging);

	
	//검색 리스트 페이징
	public int getPagingSearchCnt(Paging_f paging);

	
	//게시물 수정
	public void updateBoard(Freeboard fboard);


	//게시물 수정 시 파일 삭제
	public void deleteFile(Freeboard fboard);
	

	//게시글 삭제
	public void delete(Freeboard fboard);





}
