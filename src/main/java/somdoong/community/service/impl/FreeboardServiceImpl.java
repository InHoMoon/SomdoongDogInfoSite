package somdoong.community.service.impl;

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

import somdoong.community.dao.face.FreeboardDao;
import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.community.service.face.FreeboardService;
import somdoong.community.util.Paging_f;

@Service
public class FreeboardServiceImpl implements FreeboardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FreeboardDao fboardDao;
	@Autowired ServletContext context;
	
	
	//페이징
	@Override
	public Paging_f getPaging(int curPage) {
		
		int totalCount = fboardDao.selectCntAll();
		
		Paging_f paging = new Paging_f(totalCount, curPage);
		
		return paging;
	}
	
	
	//게시글 리스트 조회
	@Override
	public List<Freeboard> list(Paging_f paging) {
		
		return fboardDao.selectList(paging);
	}

	
	//게시글 상세보기
	@Override
	public Freeboard view(Freeboard fboard) {
		
		fboardDao.hit(fboard);
		
		return fboardDao.selectBoard(fboard);
	}
	
	
	//게시글 작성
	@Override
	public void write(Freeboard fboard, MultipartFile file) {
		//게시글 처리
		if( "".equals( fboard.getTitle() ) ) {
			fboard.setTitle("(제목없음)");
		}
		
		fboardDao.insertBoard(fboard);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		logger.info("이미지 경로 : {}", storedPath);
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		FboardFile fboardFile = new FboardFile();
		fboardFile.setFno( fboard.getFno() );
		fboardFile.setOriginName(originName);
		fboardFile.setStoredName(storedName);
		
		fboardDao.insertFile(fboardFile);		
		
	}
	
	
	@Override
	public FboardFile getAttachFile(Freeboard fboard) {
		return fboardDao.selectFileByBoardno(fboard);
	}
	
	
	@Override
	public FboardFile getFile(FboardFile fboardfile) {
		return fboardDao.selectFileByFileno(fboardfile);
	}
	
	
	//검색 리스트
	@Override
	public List<Freeboard> getList(Paging_f paging) {
		
		List<Freeboard> flist = fboardDao.selectSearchlist(paging);
		logger.info("paging : {}", paging);
		logger.info("flist : {}", flist);
		
		return flist;
	}
	
	
	//검색 리스트 페이징
	@Override
	public Paging_f getPagingSearchCnt(Paging_f paging) {
		int totalCount = fboardDao.getPagingSearchCnt(paging);
		return new Paging_f(totalCount, paging.getCurPage());
	}
	


	
	//게시글 수정
	@Override
	public void update(Freeboard fboard, MultipartFile file) {
		
		//게시글 처리
		if( "".equals( fboard.getTitle() ) ) {
			fboard.setTitle("(제목없음)");
		}
		
		fboardDao.updateBoard(fboard);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		FboardFile fboardFile = new FboardFile();
		fboardFile.setFno( fboard.getFno() );
		fboardFile.setOriginName(originName);
		fboardFile.setStoredName(storedName);
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		fboardDao.deleteFile(fboard);
		
		fboardDao.insertFile(fboardFile);		
	}
	
	
	//게시글 삭제
	@Override
	public void delete(Freeboard fboard) {
		//첨부파일 삭제
		fboardDao.deleteFile(fboard);
		
		//게시글 삭제
		fboardDao.delete(fboard);
	}

	
	
	
}
