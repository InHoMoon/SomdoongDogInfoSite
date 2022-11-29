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
import org.springframework.web.multipart.MultipartFile;

import somdoong.notice.dto.Notice;
import somdoong.notice.dto.NoticeFile;
import somdoong.notice.service.face.NoticeService;
import somdoong.util.Paging;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired NoticeService noticeService;
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model ) {
		
		Paging paging = noticeService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Notice> list = noticeService.list(paging);
		for( Notice n : list )	logger.debug("{}", n);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/view")
	public String view(Notice viewNotice, Model model) {
		logger.debug("{}", viewNotice);
		
		//잘못된 게시글 번호 처리
		if( viewNotice.getNotiNo() < 0 ) {
			return "redirect:/Notice/list";
		}
		
		//게시글 조회
		viewNotice = noticeService.view(viewNotice);
		logger.debug("조회된 게시글 {}", viewNotice);
		
		//모델값 전달
		model.addAttribute("viewNotice", viewNotice);
		
		
		//첨부파일 모델값 전달
		NoticeFile noticeFile = noticeService.getAttachFile(viewNotice);
		model.addAttribute("noticeFile", noticeFile);
		
		
		return "notice/view";
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProcess(Notice notice, MultipartFile file, HttpSession session) {
		logger.debug("{}", notice);
		logger.debug("{}", file);
		
		//작성자 정보 추가
		notice.setAdminId( (String) session.getAttribute("id") );
		logger.debug("{}", notice);
		
		//게시글, 첨부파일 처리
		noticeService.write(notice, file);
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping("/download")
	public String download(NoticeFile noticeFile, Model model) {
		
		//첨부파일 정보 객체
		noticeFile = noticeService.getFile(noticeFile);
		logger.debug("{}", noticeFile);
		
		//모델값 전달
		model.addAttribute("downFile", noticeFile);
		
		return "down";
	}
	
	@GetMapping("/update")
	public String update(Notice notice, Model model) {
		logger.debug("{}", notice);
		
		//잘못된 게시글 번호 처리
		if( notice.getNotiNo() < 0 ) {
			return "redirect:/notice//list";
		}
		
		//게시글 조회
		notice = noticeService.view(notice);
		logger.debug("조회된 게시글 {}", notice);
		
		//모델값 전달
		model.addAttribute("updateNotice", notice);
		
		
		//첨부파일 모델값 전달
		NoticeFile noticeFile = noticeService.getAttachFile(notice);
		model.addAttribute("noticeFile", noticeFile);
		
		
		return "notice/update";
	}
	
	@PostMapping("/update")
	public String updateProcess(Notice notice, MultipartFile file) {
		logger.debug("{}", notice);
		
		noticeService.update(notice, file);
		
		return "redirect:/notice/view?notiNo=" + notice.getNotiNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Notice notice) {
		
		noticeService.delete(notice);
		
		return "redirect:/notice/list";
	}
	
}
