package somdoong.mypage.dao.face;

import java.util.List;

import somdoong.mypage.dto.IBoardFile;
import somdoong.mypage.dto.Inquire;
import somdoong.util.Paging;

public interface InquireDao {

	public int selectCntAll();

	public List<Inquire> selectList(Paging paging);

	public void hit(Inquire viewInquire);

	public Inquire selectInquire(Inquire viewInquire);

	public void insertInquire(Inquire inquire);

	public void insertFile(IBoardFile iFile);

	public IBoardFile selectBoardFileByBoardNo(Inquire viewInquire);

	public IBoardFile selectBoardFileByFileNo(IBoardFile iBoardFile);

	public void updateInquire(Inquire inquire);

	public void deleteFile(Inquire inquire);

}
