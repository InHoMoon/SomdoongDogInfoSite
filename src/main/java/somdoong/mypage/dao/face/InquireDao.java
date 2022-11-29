package somdoong.mypage.dao.face;

import java.util.List;

import somdoong.mypage.dto.Inquire;
import somdoong.util.Paging;

public interface InquireDao {

	public int selectCntAll();

	public List<Inquire> selectList(Paging paging);

}
