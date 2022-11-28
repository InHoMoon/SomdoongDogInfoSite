package somdoong.community.dao.face;

import java.util.List;

import somdoong.community.dto.FboardComment;

public interface FboardCommentDao {

	public List<FboardComment> getListByfno(int fno);
	
	public int getTotal(int fno);

}
