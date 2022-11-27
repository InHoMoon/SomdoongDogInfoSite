package somdoong.community.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.util.Paging;

public interface FreeboardService {

	/**
	 * 게시글 목록 페이징
	 * 
	 * @param curPage
	 * @return
	 */
	public Paging getPaging(int curPage);

	
	/**
	 * 페이징이 적용될 게시판 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Freeboard> list(Paging paging);


	/**
	 * 게시글 상세보기
	 * 
	 * @param fboard
	 * @return
	 */
	public Freeboard view(Freeboard fboard);


	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param fboard
	 * @param file
	 */
	public void write(Freeboard fboard, MultipartFile file);


	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보 조회
	 * 
	 * @param fboard
	 * @return
	 */
	public FboardFile getAttachFile(Freeboard fboard);


	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보 조회
	 * 
	 * @param fboardfile
	 * @return
	 */
	public FboardFile getFile(FboardFile fboardfile);

}
