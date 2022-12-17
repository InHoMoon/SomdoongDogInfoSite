package somdoong.main.service.face;

import java.util.HashMap;
import java.util.List;

import somdoong.admin.dto.DogInfo;
import somdoong.notice.dto.Notice;

public interface MainService {

	//메인 showborad 리스트
	public List<HashMap<String, Object>> list();

	//공지사항 리스트..
	public List<Notice> noticeList();

	//강아지정보 리스트
	public List<DogInfo> doginfoList();


}
