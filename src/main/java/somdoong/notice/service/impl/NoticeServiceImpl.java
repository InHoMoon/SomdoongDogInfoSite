package somdoong.notice.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import somdoong.notice.dao.face.NoticeDao;
import somdoong.notice.dto.Notice;
import somdoong.notice.service.face.NoticeService;
import somdoong.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired NoticeDao noticeDao;
	@Autowired ServletContext context;
	
	//페이징
	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = noticeDao.selectCntAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Notice> list(Paging paging) {
		
		return noticeDao.selectList(paging);
		
	}
	
	//검색 리스트
	@Override
	public List<Notice> getList(Paging paging) {
		
		List<Notice> list = noticeDao.selectSearchlist(paging);
		logger.info("paging : {}", paging);
		logger.info("list : {}", list);
		
		return list;
	}
	
	
	//검색 리스트 페이징
	@Override
	public Paging getPagingSearchCnt(Paging paging) {
		int totalCount = noticeDao.getPagingSearchCnt(paging);
		return new Paging(totalCount, paging.getCurPage());
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
