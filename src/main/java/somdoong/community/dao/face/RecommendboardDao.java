package somdoong.community.dao.face;

import java.util.List;

import somdoong.community.dto.Recommendboard;
import somdoong.community.util.Paging;

public interface RecommendboardDao {

	public int selectCntAll();

	public List<Recommendboard> selectList(Paging paging);

}
