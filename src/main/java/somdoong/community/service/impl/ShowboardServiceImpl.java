package somdoong.community.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import somdoong.community.dao.face.ShowboardDao;
import somdoong.community.dto.SboardComm;
import somdoong.community.dto.SboardFile;
import somdoong.community.dto.SboardLike;
import somdoong.community.dto.Showboard;
import somdoong.community.service.face.ShowboardService;
import somdoong.util.Paging;

@Service
public class ShowboardServiceImpl implements ShowboardService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ShowboardDao showboardDao;
	
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = showboardDao.selectAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}

	@Override
	public List<HashMap<String, Object>> list(Paging paging) {
		logger.info("리스트...............");
		return showboardDao.selectList(paging);
	}

	@Override
	public SboardFile getFile(Showboard viewboard) {
		
		return showboardDao.selectFile(viewboard);
	}

	@Override
	public void write(Showboard board, MultipartFile file) {
		
		//게시글 처리
		if("".equals(board.getTitle() )) {
			board.setTitle("(제목없음)");
		}	//제목이 빈 문자열일 경우 제목없음으로 등록 시키기
		
		showboardDao.insertBoard(board);
		//----------------------------------------------------
		
		//첨부파일 처리
		
		//빈파일일 경우
		if(file.getSize() <= 0) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String origin_name = file.getOriginalFilename();
		
		//확장자를 추출
		String fileExtension = origin_name.substring(origin_name.indexOf("."), origin_name.length());
		
		String stored_name = UUID.randomUUID().toString().split("-")[4] + fileExtension;
		
		//저장할 파일의 정보 객체
		File dest = new File(storedFolder, stored_name);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//------------------------------------------------------
		
		//첨부파일 정보 DB 기록
		SboardFile sboardFile = new SboardFile();
		sboardFile.setSno(board.getSno());
		sboardFile.setOrigin_name(origin_name);
		sboardFile.setStored_name(stored_name);
		
		
		showboardDao.insertFile(sboardFile);
		
	}

	@Override
	public Showboard view(Showboard viewboard) {
		showboardDao.upHit(viewboard);
		
		return showboardDao.selectBySno(viewboard);
	}

	@Override
	public List<SboardComm> commList(int sno) throws Exception {
		return showboardDao.commList(sno);
	}

	
	@Override
	public int chkLike(SboardLike sLike) {
		return showboardDao.chkLike(sLike);
	}

	@Override
	public int insertLike(SboardLike sLike) {
		int data = showboardDao.chkLike(sLike);
		
		// 0 = 좋아요 취소 , 1 = 좋아요 등록
		if(data == 0) {
			data = showboardDao.insertLike(sLike);
			return 1;
		} else if(data == 1) {
			showboardDao.deleteLike(sLike);
			return 0;
		}
		
		return data;
	}

	@Override
	public void update(Showboard sboard, MultipartFile file) {
		//게시글 처리
		if("".equals(sboard.getTitle() )) {
			sboard.setTitle("(제목없음)");
		}	//제목이 빈 문자열일 경우 제목없음으로 등록 시키기
		
		showboardDao.updateBoard(sboard);
		//----------------------------------------------------
				
		//첨부파일 처리
				
		//빈파일일 경우
		if(file.getSize() <= 0) {
			return;
		}
				
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
				
		//파일이 저장될 이름
		String origin_name = file.getOriginalFilename();
				
		//확장자를 추출
		String fileExtension = origin_name.substring(origin_name.indexOf("."), origin_name.length());
				
		String stored_name = UUID.randomUUID().toString().split("-")[4] + fileExtension;
				
		//저장할 파일의 정보 객체
		File dest = new File(storedFolder, stored_name);
				
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		//-----------------------------------------------------				
		//첨부파일 정보 DB 기록
		SboardFile sboardFile = new SboardFile();
		sboardFile.setSno(sboard.getSno());
		sboardFile.setOrigin_name(origin_name);
		sboardFile.setStored_name(stored_name);
		
		//기존 게시글 연결된 첨부파일 삭제
		showboardDao.deleteFile(sboard);
				
		showboardDao.insertFile(sboardFile);
		
	}


}
