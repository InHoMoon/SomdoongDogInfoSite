package somdoong.mypage.service.face;

import java.util.List;

import somdoong.mypage.dto.Inquire;
import somdoong.util.Paging;

public interface InquireService {

	public Paging getPaging(int curPage);

	public List<Inquire> list(Paging paging);

}
