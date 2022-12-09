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
import somdoong.community.dto.RboardFile;
import somdoong.community.dto.Recommendboard;
import somdoong.community.service.face.RecommendboardService;
import somdoong.community.util.Paging;

@RequestMapping("/community/recommend")
@Controller
public class RecommendboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	@Autowired RecommendboardService rboardService;
	@Autowired RecommendboardService rboardService;
	
	//게시판 목록
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Recommendboard rboard, Model model) {
		
		logger.info("/community/recommend/list");
		
		Paging paging = rboardService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Recommendboard> list = rboardService.list(paging);
		for( Recommendboard r : list )	logger.info("{}", r);
		
		
		model.addAttribute("list", list);
	}
	


	//게시글 상세보기
	@RequestMapping("/view")
	public String view(Recommendboard rboard, Model model) {
		logger.info("/community/recommend/view");
		
		//잘못된 게시글 번호 처리
		if( rboard.getRno() < 0 ) {
			return "redirect:/community/recommend";
		}
		
		//게시글 조회
		rboard = rboardService.view(rboard);
		logger.info("조회된 게시글 {}", rboard);
		
		//모델값 전달
		model.addAttribute("rboard", rboard);
		
		
		//첨부파일 모델값 전달
//		RboardFile rboardFile = rboardService.getAttachFile(rboard);
//		model.addAttribute("rboardFile", rboardFile);
		
		
		return "/community/recommend/view";
	}
	
	
	//글 작성
//	@GetMapping("/write")
//	public void write() {}
//	
//	@PostMapping("/write")
//	public String writeProc(Recommendboard rboard, MultipartFile file, HttpSession session) {
//		logger.info("{}", rboard);
//		logger.info("{}", file);
//		
//		rboard.setUserid( (String) session.getAttribute("userid") );
//		logger.info("{}", rboard);
//		
//		rboardService.write(rboard, file);
//		
//		return "redirect:/community/free/list";
//	}
	
	
	
	
	
	
	
	
	

}
