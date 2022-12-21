package somdoong.mypage.dao.face;

import java.util.List;

import somdoong.mypage.dto.IBoardFile;
import somdoong.mypage.dto.Inquire;
import somdoong.util.InquirePaging;
import somdoong.util.Paging;
import somdoong.util.myinquirePaging;

public interface InquireDao {

	public int selectCntAll(Inquire inquire);

	public List<Inquire> selectList(InquirePaging paging);

	public void hit(Inquire viewInquire);

	public Inquire selectInquire(Inquire viewInquire);

	public void insertInquire(Inquire inquire);

	public void insertFile(IBoardFile iFile);

	public IBoardFile selectBoardFileByBoardNo(Inquire viewInquire);

	public IBoardFile selectBoardFileByFileNo(IBoardFile iBoardFile);

	public void updateInquire(Inquire inquire);

	public void deleteFile(Inquire inquire);

	public void delete(Inquire inquire);

	public int selectCntMyCount(Inquire inquire);

	public List<Inquire> selectListMyname(myinquirePaging paging);

}
