package somdoong.mypage.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import somdoong.mypage.dto.IBoardFile;
import somdoong.mypage.dto.Inquire;
import somdoong.util.InquirePaging;
import somdoong.util.Paging;
import somdoong.util.myinquirePaging;

public interface InquireService {

	public InquirePaging getPaging(int curPage, Inquire inquire);

	public List<Inquire> list(InquirePaging paging);

	public Inquire view(Inquire viewInquire);

	public void write(Inquire inquire, MultipartFile file);

	public IBoardFile getAttachFile(Inquire viewInquire);

	public IBoardFile getFile(IBoardFile iBoardFile);

	public void update(Inquire inquire, MultipartFile file);

	public void delete(Inquire inquire);

	public myinquirePaging getPagingmyname(int curPage, Inquire inquire);

	public List<Inquire> listmyname(myinquirePaging paging);

}
