package somdoong.community.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.community.dao.face.RecommendboardDao;
import somdoong.community.dto.Recommendboard;
import somdoong.community.service.face.RecommendboardService;
import somdoong.community.util.Paging;

@Service
public class RecommendboardServiceImpl implements RecommendboardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RecommendboardDao rboardDao;
	
	
	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = rboardDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Recommendboard> list(Paging paging) {
		return rboardDao.selectList(paging);
	}

}
