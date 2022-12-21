package somdoong.customerService.service.face;

import java.util.List;

import somdoong.customerService.dto.InComm;

public interface InCommService {

	public void cmtList(InComm inComm);

	public List<InComm> getList(int inum);

	public void insertCmt(InComm inComm);

	public void updateCmt(InComm inComm);

	public void deleteCmt(int incno);

}
