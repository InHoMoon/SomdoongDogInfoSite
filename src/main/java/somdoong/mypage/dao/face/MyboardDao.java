package somdoong.mypage.dao.face;

import java.util.List;

import somdoong.main.dto.Freeboard;
import somdoong.main.dto.Showboard;
import somdoong.mypage.dto.Myboard;

public interface MyboardDao {

	

//	public List<Freeboard> listF(Freeboard freeboard);
//
//	public List<Showboard> listS(Showboard showboard);

	public List<Myboard> listAll(Myboard myboard);
	
}
