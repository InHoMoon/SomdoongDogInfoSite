package somdoong.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import somdoong.mypage.dto.Myboard;
import somdoong.mypage.service.face.MyboardService;
import somdoong.util.Paging;

@Controller
@RequestMapping("/mypage/myboard")
public class MyboardController {

	
	@Autowired MyboardService myboardService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	

	@RequestMapping("/list")
	public String list(@RequestParam(defaultValue="0") int curPage
			,Model model , HttpSession session,Myboard myboard) {
//		logger.info("list");	
//		List<Showboard> listS = myboardService.listS(showboard);
//		List<Freeboard> listF = myboardService.listF(freeboard);

		
		
		myboard.setUserid((String) session.getAttribute("userid"));
		
		
		Paging paging = myboardService.getPaging(curPage,myboard);
		logger.debug("{}" , paging);
		model.addAttribute("paging", paging);
		
//		model.addAttribute("list", listF);
		
//		model.addAttribute("list", listS);
		paging.setmUserid((String) session.getAttribute("userid"));
     	List<Myboard> listAll = myboardService.listAll(paging);
     	for (Myboard M : listAll) logger.debug("{}", M);
		model.addAttribute("listAll" ,listAll);

		
		
		
		
		logger.info("list");
		
		return "/mypage/myboard/list";
	}
}
