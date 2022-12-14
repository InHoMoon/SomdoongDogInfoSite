package somdoong.admin.service.face;

import java.util.List;

import somdoong.admin.dto.InComm;

public interface InCommService {

	public void cmtList(InComm inComm);

	public List<InComm> getList(int inum);

	public void insertCmt(InComm inComm);

	public void updateCmt(InComm inComm);

	public void deleteCmt(int incno);

}
