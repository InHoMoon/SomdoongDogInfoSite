package somdoong.main.dao.face;

import java.util.HashMap;
import java.util.List;

import somdoong.admin.dto.DogInfo;
import somdoong.notice.dto.Notice;

public interface MainDao {

	//메인 show 조회
	public List<HashMap<String, Object>> listTop();

	//공지사항 리스트
	public List<Notice> noticeList();

	//강아지 정보 리스트
	public List<DogInfo> doginfoList();



}
