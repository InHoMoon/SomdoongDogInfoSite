package somdoong.community.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import somdoong.community.util.Paging;

@Service
public class FreeboardServiceImpl implements FreeboardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FreeboardDao fboardDao;
	@Autowired ServletContext context;
	
	
	//페이징
	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = fboardDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	
	//게시글 리스트 조회
	@Override
	public List<Freeboard> list(Paging paging) {
		
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
	public List<Freeboard> getList(String searchType, String keyword) {
		
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		List<Freeboard> flist = fboardDao.selectSearchlist(map);
		
		return flist;
	}


	//검색 리스트 페이징
	@Override
//	public Paging getPagingSearch(Paging sPaging) {
	public Paging getPagingSearch(Paging sPaging, int curPage) {
//	public Paging getPagingSearch(String searchType, String keyword, int curPage) {
		
//		int totalCount = fboardDao.selectCntSearch(searchType, keyword);
		int totalCount = fboardDao.selectCntSear(sPaging);
		logger.info("cnt : {}", totalCount);
		
		//페이징 계산
//		Paging paging = new Paging(totalCount,sPaging.getCurPage());
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	
//	@Override
//	public Paging getPagingSearch(int curPage, String searchType, String keyword) {
//	public List<Paging> getPagingSearch(int curPage, String searchType, String keyword) {
//		int totalCount = fboardDao.selectCntSearch(searchType, keyword);
//		logger.info("search cnt: {}", totalCount);
//		
//		Paging paging = new Paging(totalCount, curPage);
//		logger.info("search paging : {}", paging);
//		
//		return paging;
//	}
	
//	@Override
//	public List<Paging> getPagingSearch(int curPage, String searchType, String keyword) {
//		
//		Map<String, String> map = new HashMap<>();
//		map.put("searchType", searchType);
//		map.put("keyword", keyword);
//		
//		int totalCount = fboardDao.selectCntSearch(searchType, keyword);
//		
//		return flist;
//		
//	}
	
	
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
