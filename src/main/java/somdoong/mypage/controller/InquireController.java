package somdoong.mypage.controller;

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

import somdoong.mypage.dto.IBoardFile;
import somdoong.mypage.dto.Inquire;
import somdoong.mypage.service.face.InquireService;
import somdoong.util.Paging;

@Controller
@RequestMapping("/mypage")
public class InquireController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired InquireService inquireService;
	
	@RequestMapping("/list")
	public void inquireList(
			@RequestParam(defaultValue="0") int curPage
			,Model model) {
		
		Paging paging = inquireService.getPaging(curPage);
		logger.debug("{}" , paging);
		model.addAttribute("paging", paging);
		
		List<Inquire> list = inquireService.list(paging);
		for( Inquire I : list )	logger.debug("{}", I);
		model.addAttribute("list", list);
	}
	
	
	
	@RequestMapping("/view")
	public String view(Inquire viewInquire, Model model) {
		logger.debug("/mypage/view - {}" , viewInquire);
		
		 
		if( viewInquire.getiNum()<0) {
			return "redirect:/mypage/list";
		}
		
		viewInquire = inquireService.view(viewInquire);
		logger.debug("조회된 게시글 {}",viewInquire);
		
		model.addAttribute("viewInquire",viewInquire);
		
		
		//첨부파일 모델값 전달
		IBoardFile iBoardFile = inquireService.getAttachFile(viewInquire);
		model.addAttribute("iBoardFile",iBoardFile);
		
		return "mypage/view";
		
	}
	
	
	@GetMapping("/write")
	public void write() {
		
	}

	@PostMapping("/write")
	public String writeProcess(Inquire inquire, MultipartFile file, HttpSession session) {
	
		logger.debug("{}" , inquire);
		logger.debug("{}" , file);
		
		inquire.setiUsername ((String) session.getAttribute("id"));
		logger.debug("{}", inquire);
		
		inquireService.write(inquire,file);
		
		return "redirect:/mypage/list";  
	}
	
//	@RequestMapping("/download")
//	public String download(IBoardFile iBoardFile,Model model) {
//		
//		iBoardFile = inquireService.getFile(iBoardFile);
//		logger.debug("{}",iBoardFile);
//		
//		
//		return null;
//	}
	
}
