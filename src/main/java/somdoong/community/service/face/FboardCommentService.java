package somdoong.community.service.face;

import java.util.List;

import somdoong.community.dto.FboardComment;

public interface FboardCommentService {

	public List<FboardComment> getList(int fno);
	
	public int getTotal(int fno);

}
