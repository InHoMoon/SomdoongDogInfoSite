package somdoong.community.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
//	@RequestMapping("/list")
//	public void list() {
//		logger.info("recommend list");
//	}

}
