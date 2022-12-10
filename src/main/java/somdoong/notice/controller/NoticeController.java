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
import org.springframework.web.servlet.ModelAndView;

import somdoong.notice.dto.Notice;
import somdoong.notice.service.face.NoticeService;
import somdoong.util.Paging;

@Controller
public class NoticeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeService noticeService;
	
	
	//게시판 목록
	@GetMapping("/notice/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Notice notice, Model model) {
		
		logger.info("/notice/list");
		
		Paging paging = noticeService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Notice> list = noticeService.list(paging);	
		
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
	@RequestMapping("/notice/view")
	public String view(Notice notice, Model model) {
		logger.info("/notice/view");
		
		//잘못된 게시글 번호 처리
		if( notice.getNotino() < 0 ) {
			return "redirect:/notice/list";
		}
		
		//게시글 조회
		notice = noticeService.view(notice);
		logger.info("조회된 게시글 {}", notice);
		
		//모델값 전달
		model.addAttribute("notice", notice);
		
		return "/notice/view";
	}
	
	@GetMapping("/notice/write")
	public void write() {}
	
	@PostMapping("/notice/write")
	public String writeProcess(Notice notice, HttpSession session) {
		logger.info("{}", notice);
		
		//작성자 정보 추가
		notice.setAdminid( (String) session.getAttribute("adminid") );
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("/notice/update")
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
		
		return "/notice/update";
	}
	
	@PostMapping("/notice/update")
	public String updateProcess(Notice notice) {
		logger.info("{}", notice);
		
		noticeService.update(notice);
		
		return "redirect:/notice/view?notiNo=" + notice.getNotino();
	}
	
	@RequestMapping("/notice/delete")
	public String delete(Notice notice) {
		
		noticeService.delete(notice);
		
		return "redirect:/notice/list";
	}
	
}
