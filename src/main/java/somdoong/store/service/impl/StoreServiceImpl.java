package somdoong.store.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.store.dao.face.StoreDao;
import somdoong.store.dto.Store;
import somdoong.store.service.face.StoreService;

@Service
public class StoreServiceImpl implements StoreService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StoreDao storeDao;
	
	@Override
	public List<Store> getList(String category) {
		logger.info("{}", category);
		
		//카테고리별 게시글 조회
		return storeDao.selectByCategory(category);
	}

	@Override
	public Store view(Store viewStore) {
		
		//조회수 증가
		storeDao.updateHit(viewStore);
		
		//상세보기 조회 결과 리턴
		return storeDao.selectStore(viewStore);
	}


}
