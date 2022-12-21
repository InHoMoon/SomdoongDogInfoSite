package somdoong.mypage.service.face;

import java.util.List;

import somdoong.mypage.dto.Myboard;
import somdoong.util.MyboardPaging;
import somdoong.util.Paging;

public interface MyboardService {

//	public List<Freeboard> listF(Freeboard freeboard);
//
//	
//
//	public List<Showboard> listS(Showboard showboard);

	public List<Myboard> listAll(MyboardPaging paging);

	public MyboardPaging getPaging(int curPage, Myboard myboard);

	
	
	
}
