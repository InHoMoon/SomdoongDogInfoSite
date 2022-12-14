package somdoong.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import somdoong.main.dto.Freeboard;
import somdoong.main.dto.Showboard;
import somdoong.mypage.dto.Myboard;
import somdoong.mypage.service.face.MyboardService;

@Controller
@RequestMapping("/mypage/myboard")
public class MyboardController {

	
	@Autowired MyboardService myboardService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	

	@RequestMapping("/list")
	public String list(Model model, Myboard myboard, HttpSession session,Freeboard freeboard, Showboard showboard) {
		
//		logger.info("list");
		
	
		
//		List<Showboard> listS = myboardService.listS(showboard);
//		List<Freeboard> listF = myboardService.listF(freeboard);
		List<Myboard> listAll = myboardService.listAll(myboard);

//		
//		model.addAttribute("list", listF);
		
//		model.addAttribute("list", listS);
//		
		model.addAttribute("listAll" ,listAll);

		
		
		logger.info("list");
		
		return "/mypage/myboard/list";
	}
}
