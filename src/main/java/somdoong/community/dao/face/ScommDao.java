package somdoong.community.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import somdoong.community.dto.SboardComm;

public interface ScommDao {

	List<SboardComm> list(@Param("sno")int sno);

	void write(SboardComm comm);
	
	// 단일 댓글 조회
	public SboardComm replySelect(SboardComm comm) throws Exception;

}
