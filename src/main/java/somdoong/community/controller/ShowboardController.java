package somdoong.community.controller;

import java.util.HashMap;
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

import somdoong.community.dto.SboardFile;
import somdoong.community.dto.Showboard;
import somdoong.community.service.face.ShowboardService;
import somdoong.util.Paging;

@RequestMapping("/community")
@Controller
public class ShowboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ShowboardService showboardService;
	
	@RequestMapping("/showlist")
	public String showlist(@RequestParam(defaultValue = "0") int curPage, Showboard viewboard, Model model) {
		logger.info("showlist 요청!");
		
		Paging paging = showboardService.getPaging(curPage);
		model.addAttribute("paging", paging);
		
//		List<Showboard> list = showboardService.list(paging);
		List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) showboardService.list(paging);
		model.addAttribute("list",list);
		
//		//첨부파일 모델값 전달..
//		SboardFile file = showboardService.getFile(viewboard);
//		model.addAttribute("file",file);
		
		return "/community/showlist";
	}
	
	@GetMapping("/showwrite")
	public void write() {	}
	
	@PostMapping("/showwrite")
	public String writeProc(Showboard board, MultipartFile file, HttpSession session) {
		logger.debug("{}", board);
		logger.debug("{}", file);
		
		//작성자 정보 삽입
		board.setUserid((String)session.getAttribute("userid"));
		logger.debug("{}", board);
		
		//게시글, 첨부파일 처리
		showboardService.write(board, file);
		
		return "redirect:/community/showlist";
	}
	
	@RequestMapping("/showview")
	public String view(Showboard viewboard, Model model) {
		logger.info("/board/view");
		
		//잘못된 게시글 번호 처리
		if( viewboard.getSno() < 0 ) {
			return "redirect:/showlist";
		}
		
		//게시글 조회
		viewboard = showboardService.view(viewboard);
		//모델값 전달
		model.addAttribute("view", viewboard);
		
		//첨부파일 모델값 전달
		SboardFile file = showboardService.getFile(viewboard);
		model.addAttribute("file", file);
		
		return "/community/showview";
	}


}
