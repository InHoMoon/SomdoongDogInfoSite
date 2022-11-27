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
	public List<Store> getFoodList() {
		return storeDao.selectFood();
	}

}
