package somdoong.main.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.main.dao.face.MainDao;
import somdoong.main.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;
	
	@Override
	public List<HashMap<String, Object>> list() {
		return mainDao.listTop();
	}

}
