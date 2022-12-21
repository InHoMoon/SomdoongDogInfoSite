package somdoong.admin.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.admin.dto.DogInfo;
import somdoong.admin.dto.DogInfoFile;
import somdoong.admin.dto.DoginfoLike;
import somdoong.util.AdminPaging;

public interface DogInfoService {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging객체
	 */
	public AdminPaging getPaging(int curPage);

	
	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<DogInfo> list(AdminPaging paging);


	/**
	 * 연구소 상세보기
	 * 
	 * @param viewDogInfo - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public DogInfo view(DogInfo viewDogInfo);


	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewDogInfo - 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public DogInfoFile getAttachFile(DogInfo viewDogInfo);


	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param doginfo - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(DogInfo doginfo, MultipartFile file);


	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param doginfoFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보
	 */
	public DogInfoFile getFile(DogInfoFile doginfoFile);


	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param doginfo - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(DogInfo doginfo, MultipartFile file);


	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param doginfo
	 */
	public void delete(DogInfo doginfo);

	//좋아요 여부 확인
	public int findLike(DoginfoLike dLike);


	public int insertLike(DoginfoLike dLike);

	
	
	
}



