package somdoong.community.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import somdoong.community.dao.face.RecommendboardDao;
import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.community.dto.RboardFile;
import somdoong.community.dto.RboardLike;
import somdoong.community.dto.Recommendboard;
import somdoong.community.service.face.RecommendboardService;
import somdoong.community.util.Paging_f;

@Service
public class RecommendboardServiceImpl implements RecommendboardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RecommendboardDao rboardDao;
	@Autowired ServletContext context;
	
	
	//페이징
	@Override
	public Paging_f getPaging(int curPage) {
		
		int totalCount = rboardDao.selectCntAll();
		logger.info("cnt :{}", totalCount);
		
		Paging_f paging = new Paging_f(totalCount, curPage);
		
		return paging;
	}
	
	
	//게시글 리스트 조회
	@Override
	public List<Recommendboard> list(Paging_f paging) {
		return rboardDao.selectList(paging);
	}
	
	
	//게시글 상세보기
	@Override
	public Recommendboard view(Recommendboard rboard) {
		rboardDao.hit(rboard);
		
		return rboardDao.selectBoard(rboard);
	}
	
	
	//해당 유저의 좋아요 여부 확인
	public int findLike(RboardLike rLike) {
		return rboardDao.findLike(rLike);
	}


	
	//좋아요
	@Override
	public int insertLike(RboardLike rLike) {
		int data = rboardDao.findLike(rLike);
		
		if(data == 0 ) {
			data = rboardDao.insertLike(rLike);
			return 1;
		} else if(data == 1) {
			rboardDao.deleteLike(rLike);
			return 0;
		}
		
		return data;
	}
	
	
	
	@Override
	public void write(Recommendboard rboard, MultipartFile file) {
//	public void write(Recommendboard rboard, List<MultipartFile> file) {
		//게시글 처리
		if( "".equals( rboard.getTitle() ) ) {
			rboard.setTitle("(제목없음)");
		}
		
		rboardDao.insertBoard(rboard);
		
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
		RboardFile rboardFile = new RboardFile();
		rboardFile.setRno( rboard.getRno() );
		rboardFile.setOriginName(originName);
		rboardFile.setStoredName(storedName);
		
		rboardDao.insertFile(rboardFile);			
	}
	
	
	@Override
	public RboardFile getAttachFile(Recommendboard rboard) {
		return rboardDao.selectFileByBoardno(rboard);
	}
	
	
	@Override
	public RboardFile getFile(RboardFile rboardfile) {
		return rboardDao.selectFileByFileno(rboardfile);
	}
	
	
	//검색 리스트
	@Override
	public List<Recommendboard> getList(Paging_f paging) {
		List<Recommendboard> rlist = rboardDao.selectSearchlist(paging);
		logger.info("paging : {]", paging);
		logger.info("flist : {]", rlist);
		
		return rlist;
	}
	
	
	//검색 리스트 페이징
	@Override
	public Paging_f getPagingSearchCnt(Paging_f paging) {
		int totalCount = rboardDao.getPagingSearchCnt(paging);
		return new Paging_f(totalCount, paging.getCurPage());
	}
	
	
	@Override
	public void update(Recommendboard rboard, MultipartFile file) {
		//게시글 처리
		if( "".equals( rboard.getTitle() ) ) {
			rboard.setTitle("(제목없음)");
		}
		
		rboardDao.updateBoard(rboard);
		
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
		RboardFile rboardFile = new RboardFile();
		rboardFile.setRno( rboard.getRno() );
		rboardFile.setOriginName(originName);
		rboardFile.setStoredName(storedName);
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		rboardDao.deleteFile(rboard);
		
		rboardDao.insertFile(rboardFile);	
	}
	
	
	@Override
	public void delete(Recommendboard rboard) {
		//첨부파일 삭제
		rboardDao.deleteFile(rboard);
		
		//게시글 삭제
		rboardDao.delete(rboard);
	}
	
	
	
}
