package somdoong.admin.dao.face;

import java.util.List;

import somdoong.admin.dto.DogInfo;
import somdoong.admin.dto.DogInfoFile;
import somdoong.admin.dto.DoginfoLike;
import somdoong.util.AdminPaging;

public interface DogInfoDao {

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
	public List<DogInfo> selectList(AdminPaging paging);

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewDogInfo - 조회된 게시글 번호
	 */
	public void updateHit(DogInfo viewDogInfo);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewDogInfo - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public DogInfo selectDogInfo(DogInfo viewDogInfo);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param doginfo - 삽입할 게시글 정보
	 */
	public void insertDogInfo(DogInfo doginfo);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param doginfoFile
	 */
	public void insertFile(DogInfoFile doginfoFile);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewDogInfo - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public DogInfoFile selectDogInfoFileByDno(DogInfo viewDogInfo);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param doginfoFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public DogInfoFile selectDogInfoFileByFileNo(DogInfoFile doginfoFile);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param doginfo - 수정할 게시글 정보
	 */
	public void updateDogInfo(DogInfo doginfo);

	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제
	 * 
	 * @param doginfo - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(DogInfo doginfo);

	/**
	 * 게시글 삭제
	 * 
	 * @param doginfo - 삭제할 게시글 번호
	 */
	public void delete(DogInfo doginfo);

	public int findLike(DoginfoLike dLike);

	public int insertLike(DoginfoLike dLike);

	public void deleteLike(DoginfoLike dLike);

	
}
