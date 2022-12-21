package somdoong.community.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.community.util.Paging_f;

public interface FreeboardService {

	//게시글 목록 페이징
	public Paging_f getPaging(int curPage);

	
	//게시글 리스트 조회
	public List<Freeboard> list(Paging_f paging);


	//게시글 상세보기
	public Freeboard view(Freeboard fboard);


	//게시글, 첨부파일 작성
	public void write(Freeboard fboard, MultipartFile file);


	//게시글 번호를 이용하여 업로드된 파일 정보 조회
	public FboardFile getAttachFile(Freeboard fboard);


	//파일 번호를 이용하여 업로드된 파일 정보 조회
	public FboardFile getFile(FboardFile fboardfile);


	//키워드로 리스트 받아오기
	public List<Freeboard> getList(Paging_f paging);
	

	//검색 게시물 페이징
	public Paging_f getPagingSearchCnt(Paging_f paging);


	//게시글 수정
	public void update(Freeboard fboard, MultipartFile file);


	//게시글 삭제
	public void delete(Freeboard fboard);



}
