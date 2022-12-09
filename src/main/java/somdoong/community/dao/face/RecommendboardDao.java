package somdoong.community.dao.face;

import java.util.List;

import somdoong.community.dto.RboardFile;
import somdoong.community.dto.RboardLike;
import somdoong.community.dto.Recommendboard;
import somdoong.community.util.Paging;

public interface RecommendboardDao {

	//전체 행 수 조회
	public int selectCntAll();

	//페이징 적용해 목록 조회
	public List<Recommendboard> selectList(Paging paging);

	//게시글 번호 이용하여 게시글 조회
	public Recommendboard selectBoard(Recommendboard rboard);

	//조회수 증가
	public void hit(Recommendboard rboard);

	//해당 유저의 좋아요 여부 확인
	public int findLike(RboardLike rLike);

	//좋아요 등록
	public int insertLike(RboardLike rLike);

	//좋아요 취소
	public void deleteLike(RboardLike rLike);

	//게시글 등록
	public void insertBoard(Recommendboard rboard);

	//첨부파일 등록
	public void insertFile(RboardFile rboardFile);

	//게시글 번호를 이용하여 첨부파일 정보 조회
	public RboardFile selectFileByBoardno(Recommendboard rboard);

	//파일번호를 이용하여 첨부파일 정보 조회
	public RboardFile selectFileByFileno(RboardFile rboardfile);

}
