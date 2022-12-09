package somdoong.community.service.face;

import java.util.List;

import somdoong.community.dto.RboardFile;
import somdoong.community.dto.Recommendboard;
import somdoong.community.util.Paging;

public interface RecommendboardService {

	//게시글 목록 페이징
	public Paging getPaging(int curPage);

	//게시글 목록 조회
	public List<Recommendboard> list(Paging paging);

	//게시글 상세보기
	public Recommendboard view(Recommendboard rboard);


}
