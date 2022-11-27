package somdoong.community.controller;

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

import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.community.service.face.FreeboardService;
import somdoong.util.Paging;

@Controller
public class FreeboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FreeboardService fboardService;
	
	@RequestMapping("/community/free/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/community/free/list");
		
		Paging paging = fboardService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Freeboard> list = fboardService.list(paging);
		for( Freeboard f : list )	logger.info("{}", f);
		model.addAttribute("list", list);
	}
	
	
	
	@RequestMapping("/community/free/view")
	public String view(Freeboard fboard, Model model) {
		logger.info("/community/free/view");
		
		//잘못된 게시글 번호 처리
		if( fboard.getFno() < 0 ) {
			return "redirect:/community/free";
		}
		
		//게시글 조회
		fboard = fboardService.view(fboard);
		logger.info("조회된 게시글 {}", fboard);
		
		//모델값 전달
		model.addAttribute("fboard", fboard);
		
		
		//첨부파일 모델값 전달
		FboardFile fboardFile = fboardService.getAttachFile(fboard);
		model.addAttribute("fboardFile", fboardFile);
		
		
		return "/community/free/view";
	}
	
	
	@GetMapping("/community/free/write")
	public void write() {}
	
	@PostMapping("/community/free/write")
	public String writeProc(Freeboard fboard, MultipartFile file, HttpSession session) {
		logger.info("{}", fboard);
		logger.info("{}", file);
		
		fboard.setUserid( (String) session.getAttribute("userid") );
		fboard.setUserno( (Integer) session.getAttribute("userno") );
		logger.info("{}", fboard);
		
		fboardService.write(fboard, file);
		
		return "redirect:/community/free/list";
	}
	
	
	@RequestMapping("/community/free/download")
	public String download(FboardFile fboardfile, Model model) {
		//첨부파일 정보 객체
		fboardfile = fboardService.getFile(fboardfile);
		logger.debug("{}", fboardfile);
		
		//모델값 전달
		model.addAttribute("downFile", fboardfile);
		
		return "down";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
