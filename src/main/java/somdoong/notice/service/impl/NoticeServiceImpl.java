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
	public Notice view(Notice notice) {
		
		//조회수 증가
		noticeDao.hit(notice);
		
		//상세보기 조회 결과 리턴
		return noticeDao.selectNotice(notice);
	}
	
	@Override
	public void write(Notice notice) {
		
		//게시글 처리
		if( "".equals( notice.getTitle() ) ) {
			notice.setTitle("(제목없음)");
		}
		
		noticeDao.insertNotice(notice);	
		
	}
	
	@Override
	public void update(Notice notice) {
		
		//게시글 처리
		if( "".equals( notice.getTitle() ) ) {
			notice.setTitle("(제목없음)");
		}
		
		noticeDao.updateNotice(notice);
	
		
	}
	
	@Override
	public void delete(Notice notice) {
		
		//게시글 삭제
		noticeDao.delete(notice);
		
	}

}
