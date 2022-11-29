package somdoong.mypage.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
}
