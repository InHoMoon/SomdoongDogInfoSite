package somdoong.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.mypage.dao.face.MyboardDao;
import somdoong.mypage.dto.Myboard;
import somdoong.mypage.service.face.MyboardService;
import somdoong.util.MyboardPaging;
import somdoong.util.Paging;

@Service
public class MyboardServiceImpl implements MyboardService {
	@Autowired MyboardDao myboardDao;
	

//	@Override
//	public List<Freeboard> listF(Freeboard freeboard) {
//	
//		return myboardDao.listF(freeboard);
//	}
//	
//	
//	@Override
//	public List<Showboard> listS(Showboard showboard) {
//		
//		return myboardDao.listS(showboard);
//	}
//	
	@Override
	public List<Myboard> listAll(MyboardPaging paging) {
		return myboardDao.listAll(paging);
	}
	
	@Override
	public MyboardPaging getPaging(int curPage, Myboard myboard) {
		
		int totalCount = myboardDao.selectCntAll(myboard);
		
		MyboardPaging paging = new MyboardPaging(totalCount, curPage);
		
		return paging;
	}
}
