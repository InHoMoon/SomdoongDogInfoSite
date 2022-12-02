package somdoong.notice.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import somdoong.notice.dao.face.NoticeDao;
import somdoong.notice.dto.Notice;
import somdoong.notice.dto.NoticeFile;
import somdoong.notice.service.face.NoticeService;
import somdoong.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeDao noticeDao;
	@Autowired ServletContext context;
	
	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = noticeDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Notice> list(Paging paging) {
		return noticeDao.selectList(paging);
	}
	
	@Override
	public Notice view(Notice viewNotice) {
		
		//조회수 증가
		noticeDao.updateNotiHit(viewNotice);
		
		//상세보기 조회 결과 리턴
		return noticeDao.selectNotice(viewNotice);
	}
	
	@Override
	public void write(Notice notice, MultipartFile file) {
		
		//게시글 처리
		if( "".equals( notice.getNotiTitle() ) ) {
			notice.setNotiTitle("(제목없음)");
		}
		
		noticeDao.insertNotice(notice);
		
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
		NoticeFile noticeFile = new NoticeFile();
		noticeFile.setnFileNo( notice.getNotiNo() );
		noticeFile.setOriginName(originName);
		noticeFile.setStoredName(storedName);
		
		noticeDao.insertFile(noticeFile);		
		
	}
	
	@Override
	public void delete(Notice notice) {
		
		//첨부파일 삭제
		noticeDao.deleteFile(notice);
		
		//게시글 삭제
		noticeDao.delete(notice);
		
	}

	@Override
	public NoticeFile getAttachFile(Notice viewNotice) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeFile getFile(NoticeFile noticeFile) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Notice notice, MultipartFile file) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
