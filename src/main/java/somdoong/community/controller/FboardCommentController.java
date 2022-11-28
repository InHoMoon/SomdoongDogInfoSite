package somdoong.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import somdoong.community.dto.FboardComment;
import somdoong.community.service.face.FboardCommentService;

@RestController
public class FboardCommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FboardCommentService commService;
	
	@GetMapping("/community/free/commlist/{fno}")
	public Map<String, Object> getList(@PathVariable int fno, Model model) {
		
		logger.info("댓글 목록 컨트롤러 동작");
		
		List<FboardComment> list = commService.getList(fno);
		int total = commService.getTotal(fno);
		
		ModelAndView view = new ModelAndView();
		logger.info("댓글 갯수 " + commService.getTotal(fno));
		view.setViewName("/community/free/list");
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		return map;
	}
	
	
	
	
}
