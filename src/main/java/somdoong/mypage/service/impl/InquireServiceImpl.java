package somdoong.mypage.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.mypage.dao.face.InquireDao;
import somdoong.mypage.dto.Inquire;
import somdoong.mypage.service.face.InquireService;
import somdoong.util.Paging;

@Service
public class InquireServiceImpl implements InquireService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireDao inquireDao;
	

	@Override
	public Paging getPaging(int curPage) {

		int totalCount = inquireDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Inquire> list(Paging paging) {
		return inquireDao.selectList(paging);
	}
	
}
