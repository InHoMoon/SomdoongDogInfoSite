package somdoong.community.dao.face;

import java.util.List;

import somdoong.community.dto.Recommendboard;
import somdoong.community.util.Paging;

public interface RecommendboardDao {

	//전체 행 수 조회
	public int selectCntAll();

	//페이징 적용해 목록 조회
	public List<Recommendboard> selectList(Paging paging);

	//조회수 증가
	public void hit(Recommendboard rboard);

	//게시글 번호 이용하여 게시글 조회
	public Recommendboard selectBoard(Recommendboard rboard);

}
