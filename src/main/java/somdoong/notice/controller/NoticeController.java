package somdoong.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import somdoong.notice.dto.Notice;
import somdoong.notice.dto.NoticeFile;
import somdoong.notice.service.face.NoticeService;
import somdoong.util.Paging;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeService noticeService;
	
	
	//게시판 목록
	@RequestMapping("/list")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model) {
			
		Paging paging = noticeService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Notice> list = noticeService.list(paging);
		for( Notice n : list )	logger.info("{}", n);
		model.addAttribute("list", list);
		
	}
	
	// 게시글 검색 목록
	@PostMapping ("/notice/slist")
	@ResponseBody
	public ModelAndView search(@RequestParam(defaultValue = "title") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "0")int curPage, ModelAndView mav) {
		
		logger.info("/notice/search");
		//- 검색된 전체 게시물 수 조회
		Paging paging = new Paging();
		
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		paging.setCurPage(curPage);
		
		Paging sePaging = noticeService.getPagingSearchCnt(paging);
		sePaging.setSearchType(searchType);
		sePaging.setKeyword(keyword);
		
		List<Notice> sList = noticeService.getList(sePaging);
		
		mav.setViewName("/notice/search");
		mav.addObject("sePaging", sePaging);
		mav.addObject("sList", sList);
		mav.addObject("totalCnt",sePaging.getTotalCount());
		return mav;
	} 
	
	
	//공지사항 상세보기
	@RequestMapping("/view")
	public String view(Notice viewNotice, Model model) {
		logger.info("{}", viewNotice);
		
		//잘못된 게시글 번호 처리
		if( viewNotice.getNotino() < 0 ) {
			return "redirect:/notice/list";
		}
		
		//게시글 조회
		viewNotice = noticeService.view(viewNotice);
		logger.info("조회된 게시글 {}", viewNotice);
		
		//모델값 전달
		model.addAttribute("viewNotice", viewNotice);
		
		return "/notice/view";
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProcess(Notice notice, MultipartFile file, HttpSession session) {
		logger.info("{}", notice);
		logger.info("{}", file);
		
		//작성자 정보 추가
		notice.setAdminid( (String) session.getAttribute("adminid") );
		logger.info("{}", notice);
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping("/download")
	public String download(NoticeFile noticeFile, Model model) {
		
		//첨부파일 정보 객체
		noticeFile = noticeService.getFile(noticeFile);
		logger.info("{}", noticeFile);
		
		//모델값 전달
		model.addAttribute("downFile", noticeFile);
		
		return "down";
	}
	
	@GetMapping("/update")
	public String update(Notice notice, Model model) {
		logger.info("{}", notice);
		
		//잘못된 게시글 번호 처리
		if( notice.getNotino() < 0 ) {
			return "redirect:/notice/list";
		}
		
		//게시글 조회
		notice = noticeService.view(notice);
		logger.info("조회된 게시글 {}", notice);
		
		//모델값 전달
		model.addAttribute("updateNotice", notice);	
		
		//첨부파일 모델값 전달
		NoticeFile noticeFile = noticeService.getAttachFile(notice);
		model.addAttribute("noticeFile", noticeFile);
		
		return "/notice/update";
	}
	
	@PostMapping("/update")
	public String updateProcess(Notice notice, MultipartFile file) {
		logger.info("{}", notice);
		
		noticeService.update(notice, file);
		
		return "redirect:/notice/view?notiNo=" + notice.getNotino();
	}
	
	@RequestMapping("/delete")
	public String delete(Notice notice) {
		
		noticeService.delete(notice);
		
		return "redirect:/notice/list";
	}
	
}
