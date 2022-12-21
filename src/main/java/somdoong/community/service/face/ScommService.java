package somdoong.community.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import somdoong.community.dto.SboardComm;

public interface ScommService {

	List<SboardComm> list(int sno, HttpSession session);

	void write(SboardComm comm);
	
	// 단일 댓글 조회
	public SboardComm replySelect(SboardComm comm) throws Exception;

}
