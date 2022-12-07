package somdoong.community.service.face;

import java.util.List;


import somdoong.community.dto.Recommendboard;
import somdoong.community.util.Paging;

public interface RecommendboardService {

	public Paging getPaging(int curPage);

	public List<Recommendboard> list(Paging paging);

}
