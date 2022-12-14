package somdoong.mypage.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import somdoong.mypage.dao.face.InquireDao;
import somdoong.mypage.dto.IBoardFile;
import somdoong.mypage.dto.Inquire;
import somdoong.mypage.service.face.InquireService;
import somdoong.util.InquirePaging;
import somdoong.util.Paging;
import somdoong.util.myinquirePaging;

@Service
public class InquireServiceImpl implements InquireService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireDao inquireDao;
	
	@Autowired ServletContext context;

	@Override
	public InquirePaging getPaging(int curPage, Inquire inquire) {

		int totalCount = inquireDao.selectCntAll(inquire);
		
		InquirePaging paging = new InquirePaging(totalCount, curPage);
		
		return paging;
	}
	
	
	
	@Override
	public List<Inquire> list(InquirePaging paging) {
		return inquireDao.selectList(paging);
	}
	
	
	
	@Override
	public myinquirePaging getPagingmyname(int curPage, Inquire inquire) {
		
		int totalCount = inquireDao.selectCntMyCount(inquire);
		
		myinquirePaging paging = new myinquirePaging(totalCount, curPage);
		
		return paging;
	}
	
	
	@Override
	public List<Inquire> listmyname(myinquirePaging paging) {
		return inquireDao.selectListMyname(paging);
	}
	@Override
	public Inquire view(Inquire viewInquire) {
		
		//조회수 증가
		inquireDao.hit(viewInquire);
		
		//상세보기 조회 결과 리턴
		return inquireDao.selectInquire(viewInquire);
	}
	
	@Override
	public void write(Inquire inquire, MultipartFile file) {
		
		if("".equals(inquire.getiTitle() ) ) {
			inquire.setiTitle("(제목없음)");
		}
		
		inquireDao.insertInquire(inquire);
		
		
		//-------------------------------------------------
		//첨부 파일
		if(file.getSize() <=0) {
			return;
		}
		
		//파일이 저장될 경로
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		//파일 저장 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		File dest = new File(storedFolder,storedName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//-------------------------------------------------
		
		IBoardFile iBoardFile = new IBoardFile();
		iBoardFile.setiNum(inquire.getiNum());
		iBoardFile.setiOriginName(originName);
		iBoardFile.setiStoredName(storedName) ;
		
		inquireDao.insertFile(iBoardFile);
		
		
	}
	
	@Override
	public IBoardFile getAttachFile(Inquire viewInquire) {
		
		return inquireDao.selectBoardFileByBoardNo(viewInquire);
	}
	
	@Override
	public IBoardFile getFile(IBoardFile iBoardFile) {
		
		return inquireDao.selectBoardFileByFileNo(iBoardFile);
	}

	
	@Override
	public void update(Inquire inquire, MultipartFile file) {
		
		if("".equals(inquire.getiTitle() ) ) {
			inquire.setiTitle("(제목없음)");
		}
		
		inquireDao.updateInquire(inquire);
		
		
		//-------------------------------------------------
		//첨부 파일
		if(file.getSize() <=0) {
			return;
		}
		
		//파일이 저장될 경로
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		//파일 저장 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		File dest = new File(storedFolder,storedName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//-------------------------------------------------
		
		IBoardFile iBoardFile = new IBoardFile();
		iBoardFile.setiNum(inquire.getiNum());
		iBoardFile.setiOriginName(originName);
		iBoardFile.setiStoredName(storedName) ;
		
		
		inquireDao.deleteFile(inquire);
		
		inquireDao.insertFile(iBoardFile);
		
		
	}
	
	@Override
	public void delete(Inquire inquire) {
		
		inquireDao.deleteFile(inquire);
		
		inquireDao.delete(inquire);
		
		
	}
	

}
