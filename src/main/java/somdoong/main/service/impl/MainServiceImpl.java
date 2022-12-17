package somdoong.main.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.admin.dto.DogInfo;
import somdoong.main.dao.face.MainDao;
import somdoong.main.service.face.MainService;
import somdoong.notice.dto.Notice;

@Service
public class MainServiceImpl implements MainService {

	@Autowired MainDao mainDao;
	
	@Override
	public List<HashMap<String, Object>> list() {
		return mainDao.listTop();
	}

	//공지사항 리스트
	@Override
	public List<Notice> noticeList() {
		return mainDao.noticeList();
	}

	@Override
	public List<DogInfo> doginfoList() {
		return mainDao.doginfoList();
	}



	
}
